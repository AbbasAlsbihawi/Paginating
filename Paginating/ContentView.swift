////
////  ContentView.swift
////  Paginating
////
////  Created by Abbas on 08/03/2024.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}

//
//  PaginatingSwiftData.swift
//  Parallax Scroll Effect
//
//  Created by Abbas on 08/03/2024.
//

import SwiftUI

struct PaginatingSwiftData: View {
    @Binding private var paginationOffset:Int?
    var body: some View {
        NavigationStack{
            List{
                PaginatedView(paginationOffset:$paginationOffset) {  countries in
                   
                    ForEach (countries ){ country in
                       
                        VStack(alignment: .leading,spacing: 6, content: {
                            Text(country.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(country.code)
                                .font(.callout)
                                .foregroundStyle(.gray)
                            
                            
                        })
                    }
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            VStack{
                                Text("Countries")
                                    .font(.headline)
                                Text("Count = \(countries.count)")
                                    .font(.caption)
                                
                            }
                        }
                    }
                   
                }
            }
            .onAppear{
                if paginationOffset == nil{ paginationOffset = 0}
                
                       
            }
        }
    }
}

struct PaginatedView<Content:View>: View{
    var itemPerPage:Int = 50
    @Binding var paginationOffset:Int?
   
    // View properties

    @State var countries:[Country]=[]
    @Environment(\.modelContext) private var context
    
    @ViewBuilder private var content:([Country])-> Content
    var body:some View{
        content(countries)
            .onChange(of: paginationOffset,initial: false) { oldValue, newValue in
                do {
                    var descriptor = FetchDescriptor<Country>()
                }catch{
                    print(error.localizedDescription)
                }
            }
    }
}

#Preview {
    PaginatingSwiftData()
}

class Country {

    var name: String
    var code: String

    init(name: String, code: String) {
        self.name = name
        self.code = code
    }
   
}

//
//import SwiftUI
//
//struct PaginatingSwiftData: View {
//    var body: some View {
//        NavigationView {
//            List {
//                PaginatedView { countries in
//                    ForEach(countries) { country in
//                        Text(country.name)
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct PaginatedView<Content: View>: View {
//    var itemPerPage: Int = 50
//    @State var countries: [Country] = [
//        Country(name: "Pakistan", code: "PK"),
//        Country(name: "India", code: "IN"),
//        Country(name: "USA", code: "US"),
//        Country(name: "UK", code: "UK"),
//        Country(name: "UAE", code: "UAE"),
//        Country(name: "China", code: "CH"),
//        Country(name: "Japan", code: "JP"),
//        Country(name: "Korea", code: "KR"),
//        Country(name: "Russia", code: "RU"),
//        Country(name: "Germany", code: "DE")
//    ]
//
//    let content: ([Country]) -> Content
//
//    init(@ViewBuilder content: @escaping ([Country]) -> Content) {
//        self.content = content
//    }
//
//    var body: some View {
//        content(countries)
//    }
//}
//
//struct Country: Identifiable {
//    var id = UUID()
//    var name: String
//    var code: String
//}
//
//struct PaginatingSwiftData_Previews: PreviewProvider {
//    static var previews: some View {
//        PaginatingSwiftData()
//    }
//}
//
//
