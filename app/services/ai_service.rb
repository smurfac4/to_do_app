class AiService
  def self.suggest(task_title)
    client = Anthropic::Client.new(api_key: Rails.application.credentials.anthropic[:api_key])
    
    response = client.messages(
      parameters: {
        model: "claude-sonnet-4-20250514",
        max_tokens: 500,
        messages: [
          {
            role: "user",
            content: "Я хочу выполнить задачу: '#{task_title}'. 
            Дай мне:
            1. Краткое описание как выполнить (2-3 предложения)
            2. 3 конкретных шага
            3. Примерное время выполнения
            Отвечай на русском языке, кратко."
          }
        ]
      }
    )

    text = response.dig("content", 0, "text") || response.dig(:content, 0, :text)
    return "Не удалось получить совет от ИИ: пустой ответ от сервера" if text.blank?

    text
  rescue => e
    "Не удалось получить совет от ИИ: #{e.message}"
  end
end