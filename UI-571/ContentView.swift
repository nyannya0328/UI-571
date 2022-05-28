//
//  ContentView.swift
//  UI-571
//
//  Created by nyannyan0328 on 2022/05/28.
//

import SwiftUI

struct ContentView: View {
    @State var show : Bool = false
    @State var showDetail : Bool = false
    @Namespace var animation
    var body: some View {
        NavigationView{
            
            VStack(spacing:15){
                
                
               CardView(imageName: "p1")
                
                
                if !show{
                    
                    CardView(imageName: "p2")
                        .matchedGeometryEffect(id: "CARD", in: animation)
                        .onTapGesture {
                            
                            withAnimation(.easeInOut(duration: 4)){
                                
                                show = true
                            }
                        }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
            .navigationTitle("Swift UI Hack")
        }
        .overlay(alignment: .top) {
            
            
            if show{
                
                VStack{
                    
                   // CardView(imageName: "p1")
                    
                    
                    CardView(imageName: "p2")
                        .matchedGeometryEffect(id: "CARD", in: animation)
                    
                        .onTapGesture {
                            
                            withAnimation(.easeInOut(duration: 4)){
                                
                                showDetail = false
                            }
                            
                            
                            withAnimation(.easeInOut(duration: 4).delay(0.05)){
                                
                                show = false
                            }
                            
                            
                        }
                       
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
                .transition(.offset(x: 1, y: 1))
                .background(.white.opacity(showDetail ? 1 : 0))
                .onAppear {
                    
                    withAnimation(.easeInOut(duration: 4)){
                        
                        showDetail = true
                    }
                    
                }
            }
        
            
        }
    }
    @ViewBuilder
    func CardView(imageName : String) -> some View{
        
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
