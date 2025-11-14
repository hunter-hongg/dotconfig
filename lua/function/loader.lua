local M = {}

-- 加载指定路径的所有 Lua 模块
function M.load_modules(path)
	local config_path = vim.fn.stdpath("config")
	local full_path = config_path .. "/lua/" .. path

	-- 检查目录是否存在
	if vim.fn.isdirectory(full_path) == 0 then
		vim.notify("目录不存在: " .. full_path, vim.log.levels.WARN)
		return
	end

	-- 获取并遍历所有 Lua 文件
	for _, file in ipairs(vim.fn.readdir(full_path, [[*.lua]])) do
		local module_name = file:gsub("%.lua$", "")
		local full_module_path = path .. "." .. module_name

		-- 安全加载模块（防止单个文件错误中断整个配置）
		local status, err = pcall(require, full_module_path)
		if not status then
			vim.notify("加载失败: " .. full_module_path .. "\n错误: " .. err, vim.log.levels.ERROR)
		else
			vim.notify("成功加载: " .. full_module_path, vim.log.levels.INFO)
		end
	end
end

return M
