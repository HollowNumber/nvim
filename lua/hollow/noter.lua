local noter_jobs = {}
local zathura_pids = {}

local augroup = vim.api.nvim_create_augroup("NoterWatch", { clear = true })

local function get_pdf_path(filepath)
	local filename = vim.fn.fnamemodify(filepath, ":t:r")
	local dir = vim.fn.fnamemodify(filepath, ":h")
	return dir .. "/pdf/" .. filename .. ".pdf"
end

local function stop_zathura(bufnr, pdf_path)
	if zathura_pids[bufnr] then
		vim.fn.system("pkill -f '^zathura " .. vim.fn.escape(pdf_path, " ()[]") .. "'")
		zathura_pids[bufnr] = nil
	end
end

local function toggle_noter_watch()
	local bufnr = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(bufnr)
	local pdf_path = get_pdf_path(filepath)

	-- Stop if already running
	if noter_jobs[bufnr] then
		vim.fn.jobstop(noter_jobs[bufnr])
		noter_jobs[bufnr] = nil
		stop_zathura(bufnr, pdf_path)
		print("Noter watch and Zathura stopped")
		return
	end

	noter_jobs[bufnr] = vim.fn.jobstart({ "noter", "watch", filepath }, {
		stdout_buffered = true,
		stderr_buffered = true,
		on_exit = function(_, exit_code)
			noter_jobs[bufnr] = nil
			if exit_code ~= 0 then
				vim.notify("Noter exited with code " .. exit_code, vim.log.levels.WARN)
			end
		end,
	})

	vim.fn.system("ghostty --class=zathura-viewer -e zathura " .. vim.fn.shellescape(pdf_path) .. " > /dev/null 2>&1 &")
	zathura_pids[bufnr] = true

	print("Noter watch and Zathura started")
end

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	group = augroup,
	pattern = "*.typ",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		if noter_jobs[bufnr] then
			vim.cmd("silent! write")
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufDelete", "BufWinLeave" }, {
	group = augroup,
	pattern = "*.typ",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local filepath = vim.api.nvim_buf_get_name(bufnr)

		if noter_jobs[bufnr] then
			vim.fn.jobstop(noter_jobs[bufnr])
			noter_jobs[bufnr] = nil
		end

		stop_zathura(bufnr, get_pdf_path(filepath))
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = augroup,
	callback = function()
		for bufnr, job_id in pairs(noter_jobs) do
			vim.fn.jobstop(job_id)
		end
		for bufnr, _ in pairs(zathura_pids) do
			local filepath = vim.api.nvim_buf_get_name(bufnr)
			stop_zathura(bufnr, get_pdf_path(filepath))
		end
	end,
})

vim.api.nvim_create_user_command("NoterToggle", toggle_noter_watch, {})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "typst",
	callback = function()
		vim.keymap.set("n", "<leader>nw", toggle_noter_watch, {
			buffer = true,
			desc = "Toggle Noter watch + Zathura",
		})
	end,
})
