//
//  ContentView.swift
//  CircularProgressbar
//
//  Created by IPS-149 on 11/07/22.
//



import SwiftUI
 
struct ContentView: View {
     
    @State private var downloadAmount = 0.0
    var body: some View {
        NavigationView {
            VStack {
                ProgressView("Downloading…", value: downloadAmount, total: 100)
                    .progressViewStyle(CirclerPercentageProgressViewStyle())
                    .frame(width: 120, height: 120, alignment: .center)
                .padding()
                Button(action: {
                    withAnimation {
                        if downloadAmount < 100 {
                            downloadAmount += 10
                        }
                        print(downloadAmount)
                    }
                }, label: {
                    Text("+10%")
                })
                Button(action: {
                    withAnimation {
                        if downloadAmount <= 100 {
                            downloadAmount -= 10
                        }
                        print(downloadAmount)
                    }
                }, label: {
                    Text("-10%")
                })
            }
                 
            .navigationBarTitle("ProgressView", displayMode: .inline)
        }
         
    }
}
 
public struct CirclerPercentageProgressViewStyle : ProgressViewStyle {
    public func makeBody(configuration: LinearProgressViewStyle.Configuration) -> some View {
        VStack(spacing: 10) {
            configuration.label
                .foregroundColor(Color.secondary)
            ZStack {
                Circle()
                    .stroke(lineWidth: 15.0)
                    .opacity(0.3)
                    .foregroundColor(Color.accentColor.opacity(0.5))
                 
                Circle()
                    .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.accentColor)
                 
                Text("\(Int((configuration.fractionCompleted ?? 0) * 100))%")
                    .font(.headline)
                    .foregroundColor(Color.secondary)
            }
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
