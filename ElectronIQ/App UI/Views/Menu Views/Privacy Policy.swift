//
//  Privacy Policy.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 09/11/24.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedSection: String?
    @State private var isDrawerOpen: Bool = false
    private let sections = [
        "Introduction",
        "Interpretation and Definitions",
        "Collecting and Using Your Personal Data",
        "GDPR Privacy Notice",
        "CCPA/CPRA Privacy Notice",
        "Children's Privacy",
        "Links to Other Websites",
        "Changes to Privacy Policy",
        "Contact Us"
    ]
    
    var body: some View {
       NavigationStack {
               ZStack{
                   viewBackgroundColor()
                   ScrollView {
                       VStack(alignment: .center, spacing: 20) {
                        header
                        content
                    }
                    .padding()
                }
                   .navigationBarBackButtonHidden(true)
            }
               .blur(radius:isDrawerOpen ? 3:0)
               .overlay{
                   Drawer(isDrawerOpen: isDrawerOpen)
                   drawerButton(isDrawerOpen: $isDrawerOpen)
               }
        }
    }
    
    private var header: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("Privacy Policy")
                .font(.largeTitle)
                .bold()
            
            Text("Last updated: October 1, 2024")
                .foregroundColor(.secondary)
            
            Text("This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.")
                .foregroundColor(.secondary)
                .padding(.top, 8)
        }
    }
    
    private var content: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 24) {
                // Table of Contents
                VStack(alignment: .leading, spacing: 16) {
                    Text("Table of Contents")
                        .font(.title2)
                        .bold()
                    
                    ForEach(sections, id: \.self) { section in
                        Button(action: {
                            withAnimation {
                                selectedSection = section
                            }
                        }) {
                            Text(section)
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                // Sections Content
                InterpretationSection()
                PersonalDataSection()
                GDPRSection()
                CCPASection()
                ChildrenPrivacySection()
                LinksSection()
                ChangesSection()
                ContactSection()
            }
        }
        
    }
}

// Individual Sections
struct InterpretationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Interpretation and Definitions")
                .font(.title2)
                .bold()
            
            Text("Interpretation")
                .font(.title3)
                .bold()
            
            Text("The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.")
            
            Text("Definitions")
                .font(.title3)
                .bold()
            
            definitionItem(term: "Account", definition: "A unique account created for You to access our Service or parts of our Service.")
            definitionItem(term: "Business", definition: "Refers to the Company as the legal entity that collects Consumers' personal information.")
            definitionItem(term: "Company", definition: "Refers to Arjava Technologies, ARJAVA INDIA TECH PRIVATE LIMITED.")
        }
       
    }
    
    private func definitionItem(term: String, definition: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(term)
                .bold()
            Text(definition)
                .foregroundColor(.secondary)
        }
    }
}

struct PersonalDataSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Collecting and Using Your Personal Data")
                .font(.title2)
                .bold()
            
            Text("No personal data is collected")
             
                .foregroundColor(.secondary)
        }
    }
}

struct GDPRSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("GDPR Privacy Notice")
                .font(.title2)
                .bold()
            
            Text("Your Rights under the GDPR")
                .font(.title3)
                .bold()
            Text("No personal data is collected")
             
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 12) {
                rightItem(title: "Request access", description: "The right to access, update or delete your Personal Data.")
                rightItem(title: "Request correction", description: "The right to have incomplete or inaccurate information corrected.")
                rightItem(title: "Object to processing", description: "The right to object to our processing of your Personal Data.")
            }
        }
    }
    
    private func rightItem(title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .bold()
            Text(description)
                .foregroundColor(.secondary)
        }
    }
}

struct CCPASection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("CCPA/CPRA Privacy Notice")
                .font(.title2)
                .bold()
            
            Text("This privacy notice section for California residents supplements the information contained in Our Privacy Policy.")
            
            Text("Your Rights under the CCPA/CPRA")
                .font(.title3)
                .bold()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("The right to notice")
                    .bold()
                Text("You have the right to be notified which categories of Personal Data are being collected and the purposes for which the Personal Data is being used.")
            }
        }
    }
}

struct ChildrenPrivacySection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Children's Privacy")
                .font(.title2)
                .bold()
            
            Text("Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13.")
        }
    }
}

struct LinksSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Links to Other Websites")
                .font(.title2)
                .bold()
            
            Text("Our Service may contain links to other websites that are not operated by Us. We strongly advise You to review the Privacy Policy of every site You visit.")
        }
    }
}

struct ChangesSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Changes to this Privacy Policy")
                .font(.title2)
                .bold()
            
            Text("We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.")
        }
    }
}

struct ContactSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Contact Us")
                .font(.title2)
                .bold()
            
            Text("If you have any questions about this Privacy Policy, you can contact us.")
        }
    }
}

#Preview {
    PrivacyPolicyView()
}
