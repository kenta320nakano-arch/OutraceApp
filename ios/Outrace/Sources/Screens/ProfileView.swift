import SwiftUI

struct ProfileView: View {
    @State private var user: User = User.mockUser
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.backgroundColor
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Profile Header
                        VStack(spacing: 16) {
                            // Profile Image Placeholder
                            Circle()
                                .fill(AppTheme.primaryGreen)
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.white)
                                )
                            
                            Text(user.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text(user.email)
                                .foregroundColor(AppTheme.secondaryText)
                            
                            if let bio = user.bio {
                                Text(bio)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.top)
                        
                        // Stats
                        HStack(spacing: 40) {
                            VStack {
                                Text("0")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("Posts")
                                    .foregroundColor(AppTheme.secondaryText)
                            }
                            
                            VStack {
                                Text("0")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("Followers")
                                    .foregroundColor(AppTheme.secondaryText)
                            }
                            
                            VStack {
                                Text("0")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("Following")
                                    .foregroundColor(AppTheme.secondaryText)
                            }
                        }
                        .padding()
                        
                        // Action Buttons
                        VStack(spacing: 12) {
                            SimpleButton(title: "Edit Profile", action: {})
                            SimpleButton(title: "Settings", action: {})
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
