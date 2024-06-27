return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    require('dapui').setup()

    local dap, dapui = require 'dap', require 'dapui'

    -- dap.adapters.coreclr = {
    --   type = 'executable',
    --   command = '/usr/local/netcoredbg',
    --   args = { '--interpreter=vscode' },
    -- }
    -- dap.configurations.cs = {
    --   {
    --     type = 'coreclr',
    --     name = 'launch - netcoredbg',
    --     request = 'launch',
    --     program = function()
    --       return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
    --     end,
    --   },
    -- }
    dap.adapters.coreclr = {
      type = 'executable',
      command = '/usr/local/netcoredbg',
      args = { '--interpreter=vscode' },
    }

    dap.configurations.cs = {
      {
        type = 'coreclr',
        request = 'launch',
        name = 'Launch .NET Core file',
        program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = false,
        justMyCode = true,
      },
    }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<Leader>dt', ':DapToggleBreakpoint<CR>')
    vim.keymap.set('n', '<Leader>dd', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<Leader>ddc', dap.continue, {})
    vim.keymap.set('n', '<Leader>dc', ':DapContinue<CR>')
    vim.keymap.set('n', '<Leader>dx', ':DapTerminate<CR>')
    vim.keymap.set('n', '<Leader>do', ':DapStepOver<CR>')
  end,
}
