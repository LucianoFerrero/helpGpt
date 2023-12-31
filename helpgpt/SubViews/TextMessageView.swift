//
//  TextMessageView.swift
//  helpgpt
//
//  Created by Luciano Ferrero on 6/9/23.
//

import SwiftUI
import SwiftOpenAI

struct TextMessageView: View {
    var message: MessageChatGPT
    var body: some View {
        HStack{
            if message.role == .user{
                Spacer()
                Text(message.text)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.blue)
                    )
                    .frame(width: 240, alignment: .trailing)
            } else{
                Text(message.text)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.mint)
                    )
                    .frame(width: 240, alignment: .leading)
                Spacer()
            }
        }
    }
}

struct TextMessageView_Previews: PreviewProvider {
    static let chatGPTMessage: MessageChatGPT = .init(text: "Hola! Soy HelperGpt, estoy aqui para contestar tus preguntas.", role: .system)
    static let myMessage: MessageChatGPT = .init(text: "Puedes decirme los derivados de los monosacaridos?", role: .user)
    static var previews: some View {
        Group{
            TextMessageView(message: Self.chatGPTMessage)
                .previewDisplayName("ChatGPT Message")
            TextMessageView(message: Self.myMessage)
                .previewDisplayName("My Message")
        }
        .previewLayout(.sizeThatFits)
    }
}
