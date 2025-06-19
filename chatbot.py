from groq import Groq
is_running = True
client = Groq()
while is_running = True:
  
  message = input("enter message:")
  completion = client.chat.completions.create(
      model="meta-llama/llama-4-scout-17b-16e-instruct",
      messages=[
        {
          "role": "user",
          "content": message
        }
      ],
      temperature=1,
      max_completion_tokens=1024,
      top_p=1,
      stream=True,
      stop=None,
  )

  for chunk in completion:
      print(chunk.choices[0].delta.content or "", end="")
  print("\n")