import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var username: String
    var email: String
    var password: String
}

class UserData: ObservableObject {
    @Published var users = [User]()
    
    func addUser(username: String, email: String, password: String) {
        let newUser = User(username: username, email: email, password: password)
        users.append(newUser)
        print("User added: \(newUser.username)")
    }
}

struct ContentView: View {
    @StateObject private var userData = UserData()
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
            NavigationView {
                VStack {
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.none)
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.none)
                    
                    Button(action: {
                        userData.addUser(username: username, email: email, password: password)
                        username = ""
                        email = ""
                        password = ""
                    }) {
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    NavigationLink(destination: UserListView(userData: userData)) {
                        Text("User List")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .padding()
            }
        }
    }

struct UserListView: View {
    @ObservedObject var userData: UserData
    
    var body: some View {
        List(userData.users) { user in
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("User List")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

