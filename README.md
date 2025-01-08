# TypeScript Project Template

This template sets up a basic TypeScript development environment with configurations for both development and production.

## Features
- **Development Mode**: Outputs compiled files to the `dev` folder and watches for changes.
- **Production Mode**: Compiles and optimizes files to the `dist` folder.
- **Live Server Ready**: Includes an `index.html` file for use with the VSCode Live Server extension.
- **Source Maps**: Enabled for easier debugging during development.

## Commands
- `npm run dev`: Compile TypeScript files in watch mode for development. Outputs to `dev`.
- `npm run build`: Compile TypeScript files for production. Outputs to `dist`.
- `npm start`: Run the compiled JavaScript from the `dev` folder.

## Project Structure
```
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
```

## Usage
1. Run `npm run dev` to start development mode.
2. Open `index.html` with Live Server to view your project.
3. Use `npm run build` to generate production-ready files.
