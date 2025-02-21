//
//  PeriodicTableView.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 07/11/24.
//

import SwiftUI
import FirebaseAnalytics
struct PeriodicTableView: View {
    @State private var isDrawerOpen: Bool = false
    @StateObject private var viewModel = VersionViewModel() // version Controller
    @State var version:String?
    var body: some View {
        NavigationStack{
            ZStack{
                ZStack{
                    AppBackground()
                    viewBackgroundColor()
                    Header(content: "", selectedElement: 0)
                        .onAppear{
                            print("screen width\(screenWidth)")
//                            print("screen height\(screenHeigth)")
                        }
                    VStack(spacing:5){
                        //row 1
                        HStack(spacing:5){
                            NavigationLink(destination: {
                                DetailView(selectedElement: 0)
                            }, label: {
                                elementCard(index: 0)
                            })
                            
                            ForEach(0..<16){_ in
                                transparentElementCard()
                            }
                            NavigationLink(destination:{
                                DetailView(selectedElement: 1)
                            }, label: {
                                elementCard(index: 1)
                            })
                        }
                        //row 2
                        HStack(spacing:5){
                            ForEach(2..<4){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                            //empty boxes
                            ForEach(0..<10){_ in
                                transparentElementCard()
                            }
                            ForEach(4..<10){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                        }
                        //row 3
                        HStack(spacing:5){
                            ForEach(10..<12){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                            //empty boxes
                            ForEach(0..<10){_ in
                                transparentElementCard()
                            }
                            ForEach(12..<18){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                        }
                        //row 4
                        HStack(spacing:5){
                            ForEach(18..<36){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                        }
                        //row 5
                        HStack(spacing:5){
                            ForEach(36..<54){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                        }
                        //row 6
                        HStack(spacing:5){
                            ForEach(54..<56){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                            staticElementCard(text: "57-71")
                            ForEach(71..<86){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                        }
                        //row 7
                        HStack(spacing:5){
                            ForEach(86..<88){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                            staticElementCard(text: "89-103")
                            ForEach(0..<15){_ in
                                transparentElementCard()
                            }
                        }
                        //row 8
                        HStack(spacing:5){
                            ForEach(0..<3){_ in
                                transparentElementCard()
                            }
                            ForEach(56..<71){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                })
                            }
                        }
                        //row 8
                        HStack(spacing:5){
                            ForEach(0..<3){_ in
                                transparentElementCard()
                            }
                            ForEach(88..<103){i in
                                NavigationLink(destination: {
                                    DetailView(selectedElement: i)
                                }, label: {
                                    elementCard(index: i)
                                        
                                })
                            }
                        }
                        
                    }
                    .animation(.easeIn, value: isDrawerOpen)
                    
                    .scaleEffect(0.9)
                }
                .blur(radius:isDrawerOpen ? 3:0)
                
                Drawer(isDrawerOpen: isDrawerOpen)
                drawerButton(isDrawerOpen: $isDrawerOpen)
               
                }
            .overlay{
                if !isIPhone{
                    AdBannerView().frame(width:screenWidth * 0.8,height: 100)
                        .offset(y:screenWidth * 0.3)
                }
            }
        }
        .onAppear {
            print("\(elementCardColor.count)")
            viewModel.fetchVersion()  // Fetch version when the view appears
            Analytics.logEvent("Main_View", parameters: ["Periodic_Table":"PeriodicTableView"])
            print("periodic_Table_view_appeared")
        }
        .navigationBarBackButtonHidden(true)
    }
    
   
    @ViewBuilder
    func elementCard(index:Int)->some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(elementCardColor[index])
                .frame(width:isIPhone ? screenWidth * 0.045:screenWidth * 0.055,height:isIPhone ? screenWidth * 0.045:screenWidth * 0.055)
            Text(elementsSymbols[index])
                .font(.system(size:isIPhone ? 14:18))
                .foregroundColor(.white).bold()

        }
        .overlay(alignment:.topLeading){
            Text("\(elementsNumber[index])")
                .font(.system(size:isIPhone ? 7:10))
                .padding([.leading,.top],3)
                .foregroundColor(.white)
        }
        .overlay(alignment:.topTrailing){
            Text(String(format: "%.1f", elementsMassNo[index]))
                .font(.system(size:isIPhone ? 7:10))
                .padding([.trailing,.top],3)
                .foregroundColor(.white)
                
        }
        .overlay(alignment: .bottom){
            Text(elementsNames[index])
                .font(.system(size:isIPhone ? 7:11))
                .foregroundColor(.white)
                .lineLimit(1)
        }
        
    }
   
    func transparentElementCard()->some View{
        ZStack{
            RoundedRectangle(cornerRadius: 4)
                .fill(.clear)
                .frame(width:isIPhone ? screenWidth * 0.045:screenWidth * 0.055,height:isIPhone ? screenWidth * 0.045:screenWidth * 0.055)
        }
    }
    
    func staticElementCard(text:String)->some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .stroke(style: StrokeStyle(lineWidth: 1 ))
                .fill(.black)
                .frame(width:isIPhone ? screenWidth * 0.045:screenWidth * 0.055,height:isIPhone ? screenWidth * 0.045:screenWidth * 0.055)
            Text(text)
                .font(.system(size:isIPhone ? 10:14))
        }
    }
}



struct PeriodicTablePreview:PreviewProvider{
    static var previews: some View{
        PeriodicTableView()
    }
}





