//
//  TimerView.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 08/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct TimerView: View {
    @EnvironmentObject private var viewModel: TimerViewModel
    

    var body: some View {
        VStack {
            ZStack {
                if viewModel.timerModel.isRunning { // Barra de progresso
                    VStack {
                        ProgressView(value: Float(viewModel.timerModel.timeRemaining), total: Float(viewModel.timerModel.duration))
                            .progressViewStyle(LinearProgressViewStyle(tint: .white.opacity(0.8)))
                            .padding()
                            .offset(z: 20)
                            .animation(.easeInOut, value: viewModel.timerModel.timeRemaining)
                        
                        // Contagem regressiva
                        Text("\(viewModel.timerModel.timeRemaining) s")
                            .font(.system(size: 40))
                            .bold()
                            .contentTransition(.numericText())
                            .animation(.easeInOut, value: viewModel.timerModel.timeRemaining)
                    }
                } else if viewModel.showEndMessage { // Exibe a mensagem de fim do timer
                    VStack {
                        Text("Timer encerrado")
                            .font(.system(size: 32).bold())
                            .foregroundColor(.white)
                            .padding()
                            .offset(z: 20)
                    }
                } else { // Picker de tempo
                    VStack {
                        Button {
                            viewModel.startTimer()
                        } label: {
                            Text("Start")
                                .font(.system(size: 25).bold())
                                .padding()
                                .cornerRadius(8)
                        }
                        .glassBackgroundEffect()
                        .padding(.top, 20)
                        
                        Picker("Selecione o tempo", selection: $viewModel.selectedTime) {
                            ForEach(viewModel.timeOptions, id: \.self) { time in
                                Text("\(time) s")
                                    .font(.system(size: 30))
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .onChange(of: viewModel.selectedTime) { newValue in
                            viewModel.resetTimer(to: newValue)
                        }
                    }
                }
            }
            .frame(width: 200, height: 200)
            .background(viewModel.timerModel.isRunning ? Color.white.opacity(0.3) : Color.clear) // Altera o fundo para verde quando o timer estiver rodando
            .onTapGesture {
                // Se o timer estiver rodando, cancela o timer
                if viewModel.timerModel.isRunning {
                    // Passando o valor de selectedTime para resetar o timer
                    viewModel.resetTimer(to: viewModel.selectedTime)
                }
            }

            .onChange(of: viewModel.timerModel.timeRemaining) { newValue  in
                // Quando o tempo acabar, exibe a mensagem e faz o quadrado ficar verde por alguns segundos
                if newValue == 0 {
                    viewModel.showEndMessage = true
                }
            }
        }
    }
}

#Preview {
    TimerView()
}

