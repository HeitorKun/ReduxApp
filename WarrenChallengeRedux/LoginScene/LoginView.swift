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
    @EnvironmentObject var store: Store<AppState>
    
    @Environment(\.presentationMode) var presentationMode
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?
    @State private var isSecured: Bool = true
    
    @State var isAlertPresented: Bool = false
    
    struct Props {
        let loginState: LoginStateCases
        let onDone: (String, String) -> Void
    }
    
    private func map(state: LoginStateCases) -> Props {
        
        let props = Props(loginState: store.state.loginState.loginStateCase,
                          onDone: { email, password in
            store.dispatch(action: PostLogin(email: email, password: password))
        })
        return props
        
    }
    
    var body: some View {
        
        let props = map(state: store.state.loginState.loginStateCase)
        
        NavigationView {
            VStack {
                Spacer()
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
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
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
                Spacer()
                Divider()
                
                Button {
                    if password.count >= 6 && username.count >= 6 {
                        props.onDone(username,password)
                    }
                } label: {
                    // se já está fazendo fetch botar o circulo girando aqui
                    Text("Continuar")
                }
                .alert(
                    isPresented: $isAlertPresented ,
                    content: {
                        Alert(title: Text("Ops!"), message: Text("Login e/ou senha inválidos"), dismissButton: .default(Text("Fechar")))
                    }
                )
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
            
        }.onReceive(store.$state) { _ in
            self.isAlertPresented = store.state.loginState.loginStateCase == .loginFail
        }
        
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
