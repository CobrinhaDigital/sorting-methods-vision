//
//  TimerViewModel.swift
//  teste-vision-app
//
//  Created by ThiagoMotaMachado on 08/11/24.
//

import SwiftUI
import Combine

class TimerViewModel: ObservableObject {
    @Published var timerModel: TimerModel
    @Published var selectedTime: Int
    @Published var isImmersiveSpaceActive: Bool = false // Controla a visibilidade do espaço imersivo
    
    let timeOptions = [10, 20, 30, 40, 50, 60]
    private var timer: Timer?

    init() {
        self.selectedTime = 10
        self.timerModel = TimerModel(duration: 10, timeRemaining: 10, isRunning: false)
    }

    func startTimer() {
        timer?.invalidate()
        timerModel.timeRemaining = selectedTime
        timerModel.isRunning = true

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            // Ativa o espaço imersivo a 3 segundos do fim
            if self.timerModel.timeRemaining == 3 {
                self.isImmersiveSpaceActive = true
            }
            
            if self.timerModel.timeRemaining > 0 {
                self.timerModel.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
                self.timerModel.isRunning = false
            }
        }
    }

    func resetTimer(to newTime: Int) {
        timer?.invalidate()
        timerModel.duration = newTime
        timerModel.timeRemaining = newTime
        timerModel.isRunning = false
    }
}


