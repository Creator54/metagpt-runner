# Metagpt-runner

Metagpt-runner is a simple wrapper/runner for [MetaGPT](https://github.com/geekan/MetaGPT).

## Dependencies

- **Docker**
- **OPENAI API ACCESS**: make the API key available in the environment via `OPENAI_API_KEY` variable.

## Usage

1. Clone this repository to your local machine and navigate into it.

```sh
git clone https://github.com/creator54/metagpt-runner.git
cd metagpt-runner
```
2. Use the build script to generate the base code for a project based on a prompt. For example:

```sh
./builder "build me a cli snake game"
```

## License

[MIT](./LICENSE)
