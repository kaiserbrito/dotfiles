local status_ok, nvim_dap = pcall(require, "nvim-dap")
if not status_ok then return end

nvim_dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/dev/golang/vscode-go/dist/debugAdapter.js'};
}
nvim_dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = "${file}";
    dlvToolPath = vim.fn.exepath('/home/victor/.asdf/shims/dlv')  -- Adjust to where delve is installed
  },
}
