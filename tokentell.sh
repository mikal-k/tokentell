#!/usr/bin/env bash
#
# tokentell - Calculate usage of LLM context window. See README.md for usage instructions.
# https://github.com/mikal-k/tokentell
#
tokentell() {
  # Models! Yeah, these are probably not very accurate.
  declare -A model_sizes=(
    ["gpt3"]=2048
    ["llama1"]=2048
    ["llama2"]=4096
    ["gpt4"]=8192
    ["gpt432k"]=32768
    ["claude2"]=100000
    ["gpt2"]=117000
  )

  # The number of arguments I want is two. Not one. Not three. Two.
  if [ "$#" -ne 2 ]; then
    echo "Usage: tokentell <model_name> <file_path>"
    return 1
  fi

  model_name="$1"
  file_path="$2"

  # Verify model name. Not sure if I can echo the model_sizes models?
  if [ -z "${model_sizes[$model_name]}" ]; then
    echo "Unknown model: $model_name"
    return 1
  fi

  # Are you there, File? It is me, Toke N. Tell
  if [ ! -f "$file_path" ]; then
    echo "File not found: $file_path"
    return 1
  fi

  size_bytes=$(wc -c < "$file_path")
  percentage=$((100 * size_bytes / model_sizes[$model_name]))

  echo "Model: $model_name"
  echo "File: $file_path"
  echo "File Size: $size_bytes bytes (assuming 1 byte = 1 token)"
  echo "Percentage: $percentage% of $model_name's context window."
}

# Call the function with all command line arguments.
tokentell "$@"
