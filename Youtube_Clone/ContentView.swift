import SwiftUI

struct ContentView: View {
    var ustBolum = ["Tümü", "Yeni Öneriler", "Müzik", "Sitcom'lar", "Mix'ler", "Oyun", "Canlı"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image("youtube")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Premium")
                        .bold()
                        .font(.system(size: 29))
                    Spacer()
                    
                    Image(systemName: "airplayvideo")
                    Image(systemName: "bell.badge")
                    Image(systemName: "magnifyingglass")
                }.font(.title2)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(ustBolum, id: \.self) { b in
                            Text(b)
                                .padding(10)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                )
                                .padding(.horizontal, 1)
                        }
                    }
                }
                
                VideoView(imageName: "v1", profileImageName: "s", title: "Adele - Someone Like You (official Music Video)", views: "2,1 M", yearsAgo: "12")
                VideoView(imageName: "v2", profileImageName: "s", title: "Adele - Rolling in the Deep (official Music Video)", views: "2,5 M", yearsAgo: "13")
                VideoView(imageName: "v3", profileImageName: "s", title: "Adele - Set Fire To The Rain (Live at The Royal Albert Hall)", views: "2,5 M", yearsAgo: "13")
            }
            .padding()
        }
    }
}

struct VideoView: View {
    var imageName: String
    var profileImageName: String
    var title: String
    var views: String
    var yearsAgo: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 360, height: 200)
            
            HStack {
                Image(profileImageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                Text(title)
                    .bold()
                Spacer()
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.white)
            }
            Text("Adele \(views) görüntüleme - \(yearsAgo) yıl önce")
                .font(.system(size: 12))
                .offset(x: -28, y: -5)
        }
        .padding(.bottom)
    }
}

struct HomeView: View {
    var body: some View {
        ContentView()
    }
}


struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Anasayfa")
                    }
                }
            ShortsView()
                .tabItem {
                    VStack {
                        Image(systemName: "play.rectangle.fill")
                        Text("Shorts")
                    }
                }
            
            Paylasim()
                .tabItem {
                    VStack {
                            Image(systemName: "plus.circle")
                        
                    }
                }
            
            SubscriptionsView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.stack.fill")
                        Text("Abonelikler")
                    }
                }
            LibraryView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Siz")
                    }
                }
        }
    }
}

#Preview {
    MainView()
}
