import SwiftUI
import AVFAudio

struct TimerView: View {
    @State private var remainingSeconds = 1800 // Initial duration for the first timer (1800 seconds)
    @State private var timer: Timer? = nil
    @State private var isRunning = false
    @State private var isPaused = false
    @State private var circleTrim: CGFloat = 0.0 // Track circle trim
    @State private var isFiveMinuteTimerActive = false // Track if the five-minute timer is active
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isPausedButtonDisabled = false // Track if pause/resume button should be disabled
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 15)
                            .foregroundColor(.gray)
                        
                        Circle()
                            .trim(from: 0, to: circleTrim) // Use circleTrim
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.blue)
                            .rotationEffect(.degrees(-90)) // Rotate clockwise
                            .animation(.linear(duration: 0.1))
                    }
                    .frame(width: 300, height: 300)
                    .overlay(
                        Image("Timer")
                            .resizable()
                            .frame(width: 300, height: 300)
                    )
                }
                Spacer().frame(height:50)

                Text("\(timeString(remainingSeconds))")
                    .font(.largeTitle)
                
                if !isRunning || isFiveMinuteTimerActive {
                    Button("Start") {
                        startTimer(duration: 1800)
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(.blue)
                    .disabled(isFiveMinuteTimerActive && isRunning)
                } else {
                    HStack {
                        if !isPaused {
                            Button("Pause") {
                                pauseTimer()
                            }
                            .padding()
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .tint(.blue)
                            .disabled(isPausedButtonDisabled)
                        } else {
                            Button("Resume") {
                                resumeTimer()
                            }
                            .padding()
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .tint(.blue)
                            .disabled(isPausedButtonDisabled)
                        }
                        
                        Button("Stop") {
                            stopTimer()
                        }
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .tint(.blue)
                    }
                    .disabled(isFiveMinuteTimerActive)
                }
            }
            .navigationTitle("")
        }
        .onAppear {
            loadSound()
        }
    }
    
    
    func loadSound() {
        guard let soundURL = NSDataAsset(name: "timer_sound") else {
            print("cannot find file")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundURL.data)
            audioPlayer.prepareToPlay()
            print("Sound loaded")
        } catch {
            print("Error loading sound file: \(error.localizedDescription)")
        }
    }
    
    func startTimer(duration: Int) {
        timer?.invalidate()
        remainingSeconds = duration
        isRunning = true
        isPaused = false
        isPausedButtonDisabled = false
        updateCircleTrim()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
                updateCircleTrim()
            } else {
                stopTimer()
                audioPlayer.play()
                if duration == 1800 { // If it's the 30-minute timer, start the 5-minute timer next
                    startTimer(duration: 300) // Start a 5-minute timer
                    isPausedButtonDisabled = true // Disable pause/resume buttons during the 5-minute timer
                    isFiveMinuteTimerActive = true
                }
            }
        }
    }

    func pauseTimer() {
        timer?.invalidate()
        isPaused = true
        isPausedButtonDisabled = false // Enable pause/resume buttons when paused
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
        isPaused = false
        isPausedButtonDisabled = false // Enable pause/resume buttons when stopped
        if remainingSeconds == 0 {
            isFiveMinuteTimerActive.toggle()
        }
        remainingSeconds = 0 // Reset remaining seconds
        
        if isFiveMinuteTimerActive {
            // Start a new 30-minute timer
            startTimer(duration: 1800)
            isFiveMinuteTimerActive = false
        }
    }

    func resumeTimer() {
        startTimer(duration: remainingSeconds)
    }

    // Update circleTrim based on remaining time
    func updateCircleTrim() {
        circleTrim = 1.0 - (CGFloat(remainingSeconds) / CGFloat(isFiveMinuteTimerActive ? 300 : 1800)) // Assuming 1800 seconds for the initial timer
        if remainingSeconds == 0 {
            audioPlayer.play()}
    }
}

// Format seconds to mm:ss
func timeString(_ totalSeconds: Int) -> String {
    let minutes = totalSeconds / 60
    let seconds = totalSeconds % 60
    return String(format: "%02d:%02d", minutes, seconds)
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
