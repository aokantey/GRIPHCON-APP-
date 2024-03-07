//
//  ContentView.swift
//  GRIPHCON APP 3
//
//  Created by Abednego Okantey on 05/03/2024.
//
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("foreground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Image("logoname")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(-4.0)
                    
                    Spacer()
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

// LoginView.swift
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoginSuccess = false

    var body: some View {
        ZStack {
            Image("foreground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                
                Image("logoname")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, -150)
     
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 350, height: 55)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 350, height: 55)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    NavigationLink(destination: WelcomeView(), isActive: $isLoginSuccess) {
                        Button(action: {
                            // Check login credentials
                            if email.lowercased() == "niipebie11@gmail.com" && password == "tcmglobal" {
                                isLoginSuccess = true
                            }
                        }) {
                            Text("Log In")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 350, height: 55)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                Text("OR")
                    .foregroundColor(.orange)
                
                HStack(spacing: 20) {
                    Button(action: {
                        // Sign in with Google action
                    }) {
                        VStack {
                            Image("google icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    Button(action: {
                        // Sign in with Apple action
                    }) {
                        VStack {
                            Image("apple icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.bottom, 20)
                
                Spacer()
                
                HStack {
                    Text("Don't have an account? ")
                        .foregroundColor(.white)
                        .padding(-5)
                    NavigationLink(destination: SignUpView()) {
                        Text("CREATE AN ACCOUNT")
                            .foregroundColor(.orange)
                            .padding(-5)
                    }
                }
            }
            .padding()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// WelcomeView.swift
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        Text("Welcome")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.black)
    }
}

// SignUpView.swift
import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var confirmPassword = ""
    @State private var isWelcomeVisible = false

    var body: some View {
        ZStack {
            Image("foreground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
           
            VStack(spacing: 20) {
                Spacer()
                
                Image("logoname")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, -150)
                
                TextField("First Name", text: $firstName)
                    .padding()
                    .frame(width: 350, height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                
                TextField("Last Name", text: $lastName)
                    .padding()
                    .frame(width: 350, height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 350, height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 350, height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                
                SecureField("Re-enter Password", text: $confirmPassword)
                    .padding()
                    .frame(width: 350, height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                
                Button(action: {
                    // Validate form fields
                    // Navigate to welcome page if valid
                    isWelcomeVisible = true
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 350, height: 55)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
            .foregroundColor(.white)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $isWelcomeVisible) {
            WelcomeView()
        }
    }
}
