
# tokentell
## Calculate (badly) how much a text file will use of your LLM's context window


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

Example output: 
```bash
$  tokentell.sh gpt3 /etc/lsb-release 
Model: gpt3
File: /etc/lsb-release
File Size: 109 bytes (assuming 1 byte = 1 token)
Percentage: 5% of gpt3's context window.
```
Wait, that can't be right? Hm.

## Define your models
tokentell is pretty knowledgeable about models. It supports:

    gpt2: Good old GPT-2, with a context window of 117,000 tokens.
    gpt3: The legendary GPT-3, but it's a bit stingy with a context window of only 2048 tokens.
    claude2: Claude2, the newcomer with a generous context window of 100,000 tokens.


## Contributing

tokentell is perfect as is. 

### License

tokentell is free as in free speech, free beer, and free of responsibility. Use it as you wish at your own risk.
Calculate (badly) how much a text file will use of your LLM's context window
