//
//  WordScrambleView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/6.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct WordScrambleView: View {
    @State private var usedWord = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            VStack {
                TextField("输入你的单词", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                List(usedWord, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                        .foregroundColor(.orange)
                    Text("\($0)")
                }
            }.alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle),
                      message: Text(alertMessage),
                      dismissButton: Alert.Button.default(Text("Ok")))
            }
            .navigationBarTitle(Text(rootWord), displayMode: .large)
        }
        .onAppear(perform: startGame)
    }
    
    private func addNewWord() {
        /// 小写并去掉所有空格
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {
            return
        }
        
        /// validation
        guard isOriginal(word: answer) else {
            showAlert(title: "Word used already", message: "Be more original")
            return
        }
        guard isPossible(word: answer) else {
            showAlert(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        guard isReal(word: answer) else {
           showAlert(title: "Word not possible", message: "That isn't a real word.")
            return
        }
        usedWord.insert(answer, at: 0)
        newWord = ""
        /// reload title
        startGame()
    }
    
    private func startGame() {
        guard let fileUrl = Bundle.main.url(forResource: "start", withExtension: "txt") else {
            fatalError("Could not found start.txt.")
        }
        do {
            let word = try String(contentsOf: fileUrl)
            let words = word.components(separatedBy: "\n")
            self.rootWord = words.randomElement() ?? "---"
        } catch {
            fatalError("Could not load start.txt from bundle.")
        }
        
    }
    private func isOriginal(word: String) -> Bool {
        return !usedWord.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var temp = rootWord
        for letter in word {
            if let p = temp.firstIndex(of: letter) {
                temp.remove(at: p)
            } else {
                return false
            }
        }
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let check = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledWord = check.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledWord.location == NSNotFound
    }
    
    private func showAlert(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        self.showAlert = true
    }
}

struct WordScrambleView_Previews: PreviewProvider {
    static var previews: some View {
        WordScrambleView()
    }
}
