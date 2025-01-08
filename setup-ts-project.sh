#!/bin/bash

# Step 1: Create the directory structure
mkdir -p src dist dev

# Step 2: Initialize the project with npm
npm init -y

# Step 3: Install TypeScript as a dev dependency
npm install --save-dev typescript

# Step 4: Generate a tsconfig.json file
npx tsc --init

# Step 5: Configure tsconfig.json for development and production
cat > tsconfig.json <<EOF
{
  "compilerOptions": {
    "target": "es6",
    "module": "amd",
    "strict": true,
    "outDir": "./dev",
    "rootDir": "./src",
    "sourceMap": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
EOF

# Step 6: Add a sample TypeScript file in the src folder
echo 'const greeting: string = "Hello, TypeScript!";' > src/index.ts
echo 'console.log(greeting);' >> src/index.ts

# Step 7: Add an index.html file for Live Server
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TypeScript Project</title>
</head>
<body>
    <script src="dev/main.js"></script>
</body>
</html>
EOF

# Step 8: Update package.json with scripts for development and production
node -e "const fs = require('fs'); const pkg = JSON.parse(fs.readFileSync('package.json')); pkg.scripts = pkg.scripts || {}; pkg.scripts.build = 'tsc --outDir dist'; pkg.scripts.dev = 'tsc --watch --outDir dev'; pkg.scripts.start = 'node dev/main.js'; fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));"

# Step 9: Create a .gitignore file
echo "node_modules/" > .gitignore
echo "dist/" >> .gitignore
echo "dev/" >> .gitignore

# Step 10: Add a README file
cat > README.md <<EOF
# TypeScript Project Template

This template sets up a basic TypeScript development environment with configurations for both development and production.

## Features
- **Development Mode**: Outputs compiled files to the \`dev\` folder and watches for changes.
- **Production Mode**: Compiles and optimizes files to the \`dist\` folder.
- **Live Server Ready**: Includes an \`index.html\` file for use with the VSCode Live Server extension.
- **Source Maps**: Enabled for easier debugging during development.

## Commands
- \`npm run dev\`: Compile TypeScript files in watch mode for development. Outputs to \`dev\`.
- \`npm run build\`: Compile TypeScript files for production. Outputs to \`dist\`.
- \`npm start\`: Run the compiled JavaScript from the \`dev\` folder.

## Project Structure
\`\`\`
project-name/
├── src/          # TypeScript source files
│   └── index.ts  # Example TypeScript file
├── dev/          # Development output folder
├── dist/         # Production output folder
├── node_modules/ # Installed dependencies
├── package.json  # npm project configuration
├── tsconfig.json # TypeScript configuration
├── .gitignore    # Git ignore file
└── index.html    # HTML entry point for Live Server
\`\`\`

## Usage
1. Run \`npm run dev\` to start development mode.
2. Open \`index.html\` with Live Server to view your project.
3. Use \`npm run build\` to generate production-ready files.
EOF

# Final message
echo "TypeScript project setup complete!"
echo "Run 'npm run dev' to compile in development mode."
echo "Use 'Live Server' to serve index.html and view the project."

