import SwiftUI
import Firebase

struct Home: View {
    @StateObject var homeModel = HomeViewModel()
    
    @StateObject private var vm = LocationsViewModel()

    
    @State var color = Color.black
    
    //select category
    @State var selectedCategory: Category = categories.first!

   
    var body: some View {
        
        
        
        
        
        ZStack{
            
            
            VStack(spacing: 10){
                
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        withAnimation(.easeIn){homeModel.showMenu.toggle()}
                    }, label: {
                        
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                        //                            .foregroundColor(Color(.red))
                        
                    })
                    Text(homeModel.userLocation == nil ? "Localisering..." : "Leverera till")
                    //                        .foregroundColor(.red)
                    
                    Text(homeModel.userAdress)
                        .font(.caption)
                        .fontWeight(.heavy)
                    //                        .foregroundColor(Color(.red)
                    Spacer(minLength: 0)
                    //
                    
                    Button(action: {
                        
                        
                    }){
                        NavigationLink(destination: HomeMap()){
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.red)
                                .padding(.top, 10)
                                .padding(.horizontal, 35)
                            
                            
                            
                        }}}
                
                Divider()
                
                HStack(spacing: 15){
                    
                    TextField("Sök för restauranger och rätter", text: $homeModel.search)
                    
                        .colorScheme(.light)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                    
                    
                    Spacer()
                    
                    
                    if homeModel.search != ""{
                        
                        Button(action: {}, label: {
                            
                            Image(systemName:  "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.gray)
                            
                            
                            
                        })
                        .animation(.easeIn)
                    }
                }
                
                .padding(.horizontal)
                .padding(.top,10)
                
                Divider()
                
                
                VStack{
                    
                    
                    //categories view
                    Text("Categories")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    
                    Button(action: {
                        
                        
                    }){
                        NavigationLink(destination: Restaurants()){
                            Image(systemName: "house.lodge.circle")
                                
                                .padding(.leading)
                            
                            Text("Hitta restauranger")
                                .foregroundColor(Color.gray)
                                
                                Button(action: {
                                    
                                    
                                }){
                                    NavigationLink(destination: LocationsView().environmentObject(vm)){
                                        Image(systemName: "map")
                                            .foregroundColor(.red)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 35)
                                        
                                        
                                        
                                    }}
                                
                                
                                Spacer()
                            
                            
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false, content:{
                        
                        HStack(spacing:10){
                            
                            ForEach(categories){category in
                                
                                HStack(spacing: 10){
                                    
                                    Image(category.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:20, height: 20)
                                        .padding(1)
                                        .background(selectedCategory.id == category.id ? Color.white : Color.clear)
                                        .clipShape(Circle())
                                        .shadow(radius: 10)
                                    
                                    
                                    Text(category.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(selectedCategory.id == category.id ? .white : .red)
                                        .shadow(radius: 10)
                                    
                                    
                                }
                                
                                .padding(.vertical,12)
                                .padding(.horizontal)
                                .background(selectedCategory.id == category.id ? Color(.red) : Color(UIColor.secondarySystemBackground))
                                 .shadow(radius: 10)
                                .clipShape(Capsule())
                                //shadows
                                .onTapGesture{withAnimation(.spring()){
                                   // selectedCategory = category
                                    homeModel.selectedCategory = category
//                                    print("\(category)")
                                    homeModel.fetchData()
                                    

                                }
                                 
                                }
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    })
                    
                   
                }
                .padding(.vertical)
//                //light BG COlor
//                .background(Color.white.opacity(0.3).ignoresSafeArea())
                
                
                
                
                
                
                if homeModel.items.isEmpty{
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                }
                
                else{
                    ScrollView(.vertical, showsIndicators: false, content: {
                        
                        VStack(spacing: 25){
                            
                            ForEach(homeModel.filtered){ item in
                                
                                // item view
                                
                                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                                    
                                    ItemView(item: item)
                                    
                                    HStack{
                                        
                                        Text("Gratis hemleverans")
                                            .foregroundColor(.white)
                                            .padding(.vertical,10)
                                            .padding(.horizontal)
                                            .background(Color("red"))
                                        
                                        Spacer(minLength: 0)
                                        
                                        Button(action: {
                                            homeModel.addToCart(item: item)
                                            
                                        }, label: {
                                            
                                            Image(systemName: item.isAdded ? "checkmark" : "plus")
                                                .foregroundColor(.white)
                                                .padding(10)
                                                .background(item.isAdded ? Color.green: Color ("red"))
                                                .clipShape(Circle())
                                        })
                                        
                                    }
                                    
                                    .padding(.trailing,10)
                                    .padding(.top,10)
                                    
                                    Spacer()
                                    
                                
                                    
                                    HStack{
                                        
                                        
                                        Image(systemName: "clock")
                                        Text("25-30min")
                                    }
                                                .foregroundColor(.black)
                                                .background(Color(.white))
                                                .cornerRadius(15)
                                                .position(x:55, y:235)
                                          
                                })
                               
                           
                                
                                .frame(width: UIScreen.main.bounds.width - 30)
                                .foregroundColor(.red)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                                
                            }
                        }
                        
                        .padding(.top, 10)
                        
                        
                        
                    })
                    
              
                    
//                    VStack{
//
//                        HStack(spacing: 0){
//
//
//                            Text("Dagens favoriter")
//
//
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .padding(.leading)
//                        .padding(.top)
//
//
//                        Spacer()
//                            .frame(height: 10)
//
//                        TabView{
//
//                            Image("Pizzan")
//                            Image("Carbonara")
//                            Image("Vitlöksbröd")
//
//
//                        }
//
//
//                        .frame(width: UIScreen.main.bounds.width - 30)
//                        .cornerRadius(15)
//                        .padding(.top)
//                        .tabViewStyle(PageTabViewStyle())
//
//
//
//                        .overlay(Text("Nyhet").background(Color("yellow")).padding(.vertical,30)
//                            .padding(.trailing), alignment: .topLeading).foregroundColor(.black)
//
//                        Spacer()
//
                        
//                    }
                }
                
            }
            
            
            // side menu
            
            HStack{
                
                
                
                Menu(homeData: homeModel)
                
                // move effect from left
                    .offset(x: homeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                
                
                Spacer(minLength: 0)
            }
            
            .background(Color.black.opacity(homeModel.showMenu ? 0.3 : 0).ignoresSafeArea())
            //closing when taps on outside
            .onTapGesture(perform: {
                withAnimation(.easeIn){homeModel.showMenu.toggle()}
            })
            
            
            
            // non closable alert if permission denied
            
            if homeModel.noLocation{
                
                Text("Please Enable Location Access In Settings To Further Move On !!!")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .background(Color.black.opacity(0.3).ignoresSafeArea())
                
                
                
                
            }
            
        }
        
        
        
        .onAppear(perform: {
            // calling location delegate
            homeModel.locationManager.delegate = homeModel
            
        })
        
        .onChange(of: homeModel.search, perform: { value in
            
            // to avoid continues search request
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                if value == homeModel.search && homeModel.search != ""{
                    
                    // search data
                    
                    homeModel.filterData()
                    
                }
            }
            
            if homeModel.search == ""{
                // reset all data
                withAnimation(.linear){homeModel.filtered = homeModel.items}
            }
            
        })
        
    }
}
