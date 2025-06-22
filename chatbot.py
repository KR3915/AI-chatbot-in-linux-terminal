from groq import Groq
import sys

client = Groq()

while True:
    try:
        message = input("enter message (type 'q' to quit): ")
        if message.strip().lower() == 'q':
            print("Q pressed! Exiting...")
            break
        message = f"{message}, answer max 350 chars"
        completion = client.chat.completions.create(
            model="meta-llama/llama-4-scout-17b-16e-instruct",
            messages=[{"role": "user", "content": message}],
            temperature=0,
            max_completion_tokens=70,
            top_p=1,
            stream=True,
            stop=None,
        )

        for chunk in completion:
            content = chunk.choices[0].delta.content
            if content:
                print(content, end="", flush=True)
        print()
    except (EOFError, KeyboardInterrupt):
        print("\nExiting...")
        break

print("chat closed")
sys.exit(0)
