//
//  About Us.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 09/11/24.
//

import SwiftUI

import SwiftUI

struct TeamMember: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let imageSystemName: String
    let description: String
    let link:String
}

struct AboutUsView: View {
    @State private var isDrawerOpen: Bool = false
    let teamMembers = [
        TeamMember(
            name: "Mr. Sham Edward J",
            role: "Developer",
            imageSystemName: "keyboard.chevron.compact.down.fill",
            description: "Arjava India Tech Private Ltd., Chennai", link: "https://www.linkedin.com/in/sham-edward-5842b8287/"
        ),
        TeamMember(
            name: "Mr. Harrish Muthuram L M",
            role: "Designer",
            imageSystemName: "pencil.and.ruler.fill",
            description: "Arjava India Tech Private Ltd., Chennai", link: "https://www.linkedin.com/in/harrish-lm/"
        ),
        TeamMember(
            name: "Ms. Shruthi Vairavan",
            role: "Creative Spark",
            imageSystemName:"lightbulb.max.fill",
            description: "11th Grade, Eastlake High School, WA, USA", link: "https://www.linkedin.com/in/palani-vairavan-84b3921/"
        ),
        TeamMember(
            name: "Mr. Raghul Vijayan",
            role: "Test Engineer",
            imageSystemName: "list.bullet.clipboard.fill",
            description: "Validation Test Lead, Cognizant, Chennai", link: "https://www.linkedin.com/in/raghul-vijayan/"
        ),
        TeamMember(
            name: "Mr. Siranjeevan C",
            role: "Data Aggregator",
            imageSystemName: "books.vertical.fill",
            description: "I Year - BCA, Nachiappa Swamigal Arts & Science College, Karaikudi", link: "https://www.linkedin.com/company/arjavatech/posts/?feedView=all"
        ),
        TeamMember(
            name: "Mr. Pitchaimani Rajaram",
            role: "Development Manager",
            imageSystemName: "briefcase.fill",
            description: "Arjava India Tech Private Ltd., Chennai", link: "https://www.linkedin.com/in/mani-rr-b93397201/"
        ),
        TeamMember(
            name: "Mr. Arivarasan V",
            role: "Mentor",
            imageSystemName: "brain.head.profile.fill",
            description: "Science Communicator, Tamil Nadu", link: "https://www.linkedin.com/company/arjavatech/posts/?feedView=all"
        ),
        TeamMember(
            name: "Dr. Meenakshi Sundaram",
            role: "Mentor",
            imageSystemName: "brain.head.profile.fill",
            description: "Applied Data Scientist, Computational Modeler, Intel Inc., Portland, USA", link: "https://www.linkedin.com/in/meenakshi-sundaram/"
        ),
        TeamMember(
            name: "Mr. Palani Vairavan",
            role: "Advisor",
            imageSystemName: "crown.fill",
            description: "Engineering Manager(AWS), Amazon Inc., Seattle, USA", link: "https://www.linkedin.com/in/palani-vairavan-84b3921/"
        )
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 10)
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                viewBackgroundColor()
                
                VStack(spacing: 20) {
                    
                    headerSection
                    teamSection
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarBackButtonHidden(true)
            .blur(radius:isDrawerOpen ? 3:0)
            .overlay{
                Drawer(isDrawerOpen: isDrawerOpen)
                drawerButton(isDrawerOpen: $isDrawerOpen)
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 10) {
            Text("About Us")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.primary)
            
            Text("Arjava Technologies provides full stack IT products & solutions and UI/UX designing")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
        }
    }
    
    private var teamSection: some View {
        VStack( spacing: 10) {
            Text("Our Team")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            //1st row
            HStack{
                ForEach(0..<3,id: \.self) { member in
                    TeamMemberCard(member: teamMembers[member])
                }
            }
            //2nd row
            HStack{
                ForEach(3..<6,id: \.self) { member in
                    TeamMemberCard(member: teamMembers[member])
                }
            }
            HStack{
                ForEach(6..<9,id: \.self) { member in
                    TeamMemberCard(member: teamMembers[member])
                }
            }
//            LazyVGrid(columns: columns, spacing: 10) {
//                ForEach(teamMembers) { member in
//                    TeamMemberCard(member: member)
//                }
//            }
        }
    }
}

struct TeamMemberCard: View {
    let member: TeamMember
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: geometry.size.height * 0.05) {
                HStack(spacing: geometry.size.width * 0.04) {
                    Image(systemName: member.imageSystemName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: min(geometry.size.width * 0.15, 30), height: min(geometry.size.width * 0.15, 30))
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(member.name)
                            .font(.system(size: min(geometry.size.width * 0.05, 14)))
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                        
                        Link(destination: URL(string: member.link)!, label: {
                            Text(member.role)
                                .font(.system(size: min(geometry.size.width * 0.04, 12)))
                                .foregroundColor(.blue)
                        })
                        
                    }
                }
                
                Text(member.description)
                    .font(.system(size: min(geometry.size.width * 0.04, 12)))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(geometry.size.width * 0.05)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.secondarySystemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
            )
        }
       
        .aspectRatio(2.5, contentMode: .fit)
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
