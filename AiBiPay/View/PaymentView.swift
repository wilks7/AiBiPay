//
//  PaymentView.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import SwiftUI

struct PaymentView: View {
    @EnvironmentObject var session: SessionViewModel
    @StateObject var speechRecognizer = SpeechRecognizer()

    @State var isRecording = false
    @State var showBill = false
    
    var body: some View {
        VStack {
            header
            Button(action: buttonTapped) {
                buttonView
            }
            Text(speechRecognizer.transcript)
        }
        .padding()
        .sheet(isPresented: $showBill) {
            BillView { receipt in
                session.add(receipt: receipt)
            }
        }
    }
    
    var header: some View {
        Text(isRecording ? Strings.recording : Strings.header)
        .font(.largeTitle)//.fontWeight(.thin)
        .foregroundColor(.gray)
    }
    
    var buttonView: some View {
        Group {
            if isRecording {
                Rectangle()
            } else {
                Circle()
            }
        }
        .foregroundColor(.red)
        .frame(width: 100, height: 100)

    }
    
    private func buttonTapped(){
        if isRecording {
            speechRecognizer.stopTranscribing()
            isRecording = false
            print(speechRecognizer.transcript)
//            showQR = true
            showBill = true
        } else {
            speechRecognizer.reset()
            speechRecognizer.transcribe()
            isRecording = true
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
            .environmentObject(SessionViewModel())
    }
}
