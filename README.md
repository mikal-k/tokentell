
# tokentell
> Calculate (badly) how much a text file will use of your LLM's context window


This crude script attempts to give an indication if a text file will fit in a LLM's context window. 

You can run tokentell as a script, or source it and use it as a function. 

Options: 
- Source it in your current shell or script with `source tokentell.sh` and call `tokentell()`.
- Append it to your .bashrc for availability in all new shell sessions.
- Manual run as a script from your ~/bin or... you know what? You know `chmod +x` and all that, I don't need to tell you.

## Usage

tokentell is simple. Just tell it the model and the file:
```bash
tokentell <model_name> <file_path>
```
And voila! You get a detailed report on the model, the file, the file size (assuming 1 byte = 1 token, tokentell isn't a language expert), and the percentage of the model's context window that your file is hogging.

There's no magic. You define the model size at the start of the file. 

Example output run as a script: 
```bash
$ tokentell.sh gpt3 /etc/lsb-release 
Model: gpt3
File: /etc/lsb-release
File Size: 109 bytes (assuming 1 byte = 1 token)
Percentage: 5% of gpt3's context window.
```

Well, as a function isn't really different: 
```bash
$ source /home/mikal/bin/tokentell.sh
Usage: tokentell <model_name> <file_path>
$ tokentell gpt3 /etc/mime.types
Model: gpt3
File: /etc/mime.types
File Size: 72029 bytes (assuming 1 byte = 1 token)
Percentage: 3517% of gpt3's context window.
```

Hm, can those values be correct? Hm.

## Define your models
tokentell is pretty knowledgeable about models. It supports:


["gpt3"]=2048
["llama1"]=2048
["llama2"]=4096
["gpt4"]=8192
["gpt432k"]=32768
["claude2"]=100000
["gpt2"]=117000

I dunno for sure about the values, google or a chatbot told me =)

## Contributing

tokentell is perfect as is, but sure, fine, I don't care. 

### License

tokentell is free as in free speech, free beer, and free of responsibility. Use it as you wish at your own risk.


