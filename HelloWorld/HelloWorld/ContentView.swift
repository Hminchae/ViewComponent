//
//  ContentView.swift
//  HelloWorld
//
//  Created by 황민채 on 12/21/23.
//


import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}
struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        //MARK: - 1. Basic
        
        //AsyncImage(url: URL(string: imageURL))
        
        //MARK: - 2. Scale
        
        //AsyncImage(url: URL(string: imageURL), scale: 3.0) // scale 크기가 작을 수록 이미지는 커짐
        
        //MARK: - 3. PlaceHolder
        
        /*
         AsyncImage(url: URL(string: imageURL)) { image in
            image.imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
        }
        .padding(40)
         */
        
        //MARK: - 4. phase
        
        /*AsyncImage(url: URL(string: imageURL)) { phase in
            // Success: The image succesfully loaded.
            // Failure: The image failed to load with an error.
            // Empty: No image is loaded.
            
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName:  "ant.circle.fill").iconModifier()
            } else {
                Image(systemName:  "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)
         */
        
        //MARK: - 5. Animation
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                    //.transition(.move(edge: .bottom))
                    //.transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct GradientTextView: View {
    var body: some View {
        VStack {
            Text("iOS")
                .font(.system(size: 180))
                .fontWeight(.black)
                .foregroundStyle(.teal.gradient)
            //MARK: gradient
            Text("iOS")
                .font(.system(size: 180))
                .fontWeight(.black)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
        }
    }
}
