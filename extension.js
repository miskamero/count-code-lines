const vscode = require('vscode');
const path = require('path');

function runPowerShellScript() {
    const terminal = vscode.window.createTerminal({ name: "Count Lines Terminal" });

    // Specify the path to your Node.js script within the extension directory
    const scriptPath = path.join(__dirname, "runScript.js");

    terminal.show();
    terminal.sendText(`node "${scriptPath}"`);
}

function activate(context) {
    let disposable = vscode.commands.registerCommand('count-lines-of-code.runPowerShellScript', runPowerShellScript);

    context.subscriptions.push(disposable);
}
exports.activate = activate;

function deactivate() { }
exports.deactivate = deactivate;
