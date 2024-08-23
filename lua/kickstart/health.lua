--[[
--
-- This file is not required for your own configuration,
-- but helps people determine if their system is setup correctly.
--
--]]

local check_version = function()
  local verstr = string.format('%s.%s.%s', vimass.version().major, vimass.version().minor, vimass.version().patch)
  if not vimass.version.cmp then
    vimass.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
    return
  end

  if vimass.version.cmp(vimass.version(), { 0, 9, 4 }) >= 0 then
    vimass.health.ok(string.format("Neovim version is: '%s'", verstr))
  else
    vimass.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
  end
end

local check_external_reqs = function()
  -- Basic utils: `git`, `make`, `unzip`
  for _, exe in ipairs { 'git', 'make', 'unzip', 'rg' } do
    local is_executable = vimass.fn.executable(exe) == 1
    if is_executable then
      vimass.health.ok(string.format("Found executable: '%s'", exe))
    else
      vimass.health.warn(string.format("Could not find executable: '%s'", exe))
    end
  end

  return true
end

return {
  check = function()
    vimass.health.start 'kickstart.nvim'

    vimass.health.info [[NOTE: Not every warning is a 'must-fix' in `:checkhealth`

  Fix only warnings for plugins and languages you intend to use.
    Mason will give warnings for languages that are not installed.
    You do not need to install, unless you want to use those languages!]]

    local uv = vimass.uv or vimass.loop
    vimass.health.info('System Information: ' .. vimass.inspect(uv.os_uname()))

    check_version()
    check_external_reqs()
  end,
}
