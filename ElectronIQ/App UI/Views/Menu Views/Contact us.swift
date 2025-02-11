//
//  Contact us.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 09/11/24.
//

import SwiftUI

struct Contact_us:View {
    @State private var isDrawerOpen: Bool = false
    let cards:[ContactUsCard] = [
        ContactUsCard(
            header: "Email", title: "Contact through on Email",
            image: email,
            link: URL(string: "mailto:tech@arjavatech.com")!
        ),
        ContactUsCard(
            header: "Facebook", title: "Follow us on facebook",
            image: facebook,
            link: URL(string: "https://www.facebook.com/profile.php?id=100067001514838")!
        ),
        
        ContactUsCard(
            header: "LinkedIn", title: "Follow us on LinkedIn",
            image: linkedin,
            link: URL(string: "https://www.linkedin.com/company/arjavatech/posts/?feedView=all")!
        ),
        ContactUsCard(
            header: "Instagram", title: "Follow us on Instagram",
            image: instagram,
            link: URL(string: "https://www.instagram.com/arjavatech/")!
        )
    ]
    var body: some View {
        NavigationStack{
            ZStack{
                viewBackgroundColor()
                VStack{
                    Text("Contact Us").padding().font(.custom(headerFont, size: 30).bold())
                    HStack{
                        Image(contactUs)
                            .resizable()
                            .scaledToFit()
                            .frame(width: isIPhone ? screenWidth * 0.5 : screenWidth * 0.5)
                            .padding()
                        VStack{
                            ForEach(cards,id: \.self){cards in
                                cards
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .blur(radius:isDrawerOpen ? 3:0)
            .overlay{
                Drawer(isDrawerOpen: isDrawerOpen)
                drawerButton(isDrawerOpen: $isDrawerOpen)
            }
        }
    }
}

struct ContactUsCard: View, Hashable {
    var header: String
    var title: String
    var image: String
    var link: URL
    
    var body: some View {
        ZStack {
            // Background rounded rectangle
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: screenWidth * 0.35, height: isIPhone ? screenHeigth * 0.08 : screenHeigth * 0.1)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
            
            // Content overlay
            HStack(alignment: .center, spacing: 12) {
                // Image
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40) // Adjusted image size for better balance
                
                // Text content
                VStack(alignment: .leading, spacing: 4) {
                    Text(header)
                        .font(.headline)
                        .foregroundColor(.blackFont)
                    
                    Link(title, destination: link)
                        .font(.subheadline)
                        .foregroundColor(.blue) // Standard color for links
                }
            }
            .padding(.horizontal, 12) // Horizontal padding for better spacing
        }
       // Vertical padding outside the card for spacing between multiple cards
    }
}


#Preview {
    Contact_us()
}
