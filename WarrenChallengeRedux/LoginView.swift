//
//  LoginView.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 13/11/22.
//

import SwiftUI

struct LoginView: View {
    
    enum Field: Hashable {
        case usernameField
        case passwordField
    }
    
    @Environment(\.presentationMode) var presentationMode
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?
    @State private var isSecured: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    HStack{
                        Image(systemName: "envelope")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color(VisualConstants.black))
                            .frame(minWidth: 0, maxWidth: 30)
                            .frame(minHeight: 0, maxHeight: 33)
                        
                        TextField(
                            "E-mail",
                            text: $username
                        )
                        .onSubmit {
                            focusedField = .passwordField
                        }
                        .focused($focusedField, equals: .usernameField)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                self.focusedField = .usernameField
                            }
                        }
                    }
                    .padding()
                }
                .overlay(content: {
                    RoundedRectangle(cornerRadius: VisualConstants.cornerRadius)
                        .inset(by: 3)
                        .stroke(Color(VisualConstants.black), lineWidth: 1)
                })
                .padding([.trailing,.leading])
                
                VStack{
                    HStack{
                        Image(systemName: "lock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color(VisualConstants.black))
                            .frame(minWidth: 0, maxWidth: 30)
                            .frame(minHeight: 0, maxHeight: 33)
                        
                        
                        if isSecured {
                            SecureField(
                                "Senha",
                                text: $password
                            )
                            .onSubmit {
                                
                            }
                            .focused($focusedField, equals: .passwordField)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                        } else {
                            TextField(
                                "Senha",
                                text: $password
                            )
                            .onSubmit {
                                
                            }
                            .focused($focusedField, equals: .passwordField)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                        }
                        
                        Button {
                            isSecured.toggle()
                        } label: {
                            Image(systemName: isSecured ? "eye.slash" : "eye")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundColor(Color(VisualConstants.black))
                                .frame(minWidth: 0, maxWidth: 30)
                        }
                        
                        
                    }
                    .padding()
                }
                .overlay(content: {
                    RoundedRectangle(cornerRadius: VisualConstants.cornerRadius)
                        .inset(by: 3)
                        .stroke(Color(VisualConstants.black), lineWidth: 1)
                })
                .padding([.trailing,.leading])
                
                Divider()
                
                Button {
                    
                } label: {
                    Text("Continuar")
                }
                .buttonStyle(WideButtonStyle())
                .padding()
                
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .tint(Color(VisualConstants.black))
                    }
                    .padding()
                }
            })
            .navigationTitle("Login")
            .tint(Color(VisualConstants.black))
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
