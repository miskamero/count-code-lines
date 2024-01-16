const { execSync } = require('child_process');
const path = require('path');

// Get the extension directory
const extensionDir = __dirname;

// Specify the path to your PowerShell script within the extension directory
const scriptPath = path.join(extensionDir, "CountLines.ps1");

execSync(`powershell.exe -ExecutionPolicy Bypass -File "${scriptPath}"`, { stdio: 'inherit' });
