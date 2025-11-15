local M = {}

function M.load_modules(path)
  local config_path = vim.fn.stdpath("config")
  local full_path = config_path .. "/lua/" .. path
  
  -- 检查目录是否存在
  if vim.fn.isdirectory(full_path) == 0 then
    vim.notify("目录不存在: " .. full_path, vim.log.levels.WARN)
    return
  end

  -- 修复：使用 glob 代替 readdir 的模式匹配
  local lua_files = vim.fn.glob(full_path .. "/*.lua", false, true)
  
  for _, file_path in ipairs(lua_files) do
    -- 从完整路径中提取文件名
    local file = vim.fn.fnamemodify(file_path, ":t")
    local module_name = file:gsub("%.lua$", "")
    local full_module_path = path .. "." .. module_name
    
    -- 安全加载
    local status, err = pcall(require, full_module_path)
    if not status then
      vim.notify("加载失败: " .. full_module_path .. "\n错误: " .. err, vim.log.levels.ERROR)
    end
  end
end

return M
