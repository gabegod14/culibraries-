//
//  ViewController.swift
//  culibraries
//
//  Created by Gabriel Godoy on 11/27/22.
//

import UIKit

class ViewController: UIViewController {

    var libs: [Library] = []
    let LibraryTableView = UITableView()
    let reuseIdentifier = "libraryReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CornellLibraries+"
        
        view.backgroundColor = .red
        
        let olin = Library(picture: "olin", name: "Olin Library", addressLabel: "161 Ho Plaza", description: "It took seven years of planning and $5.7 million to build Olin Library, the first library specifically designed as a research facility. In the words of Anne R. Kenney, Carl A. Kroch University Librarian: “Today Olin remains a vital place for research and study, with between 3,000 and 11,000 visitors a day at peak academic times. The mind boggles at what the next 50 years will bring, but I’m betting Olin Library will still be a place that draws those who value the life of the mind.”", rateL: "Rate:", rate: "____", link: "https://olinuris.library.cornell.edu/quiet-group-study-spaces", canReserve: true, star: false, id : 1, map_image : "", open_hour : 0, close_hour : 0)
        let uris = Library(picture: "uris", name: "Uris Library", addressLabel: "160 Ho Plaza", description: "Uris Library opened in 1891 as Cornell’s first library building. Designed by William Henry Miller, Cornell’s first student of architecture, in the Richardsonian Romansque style, the library garnered national acclaim for its combination of beauty and utility. The University Library, as it was known, was refurbished in 1962 with funds from Harold ’26 and Percy Uris, and was renamed in recognition of their generous contribution. Uris also contains the A.D. White Library. , a library within a library designed by Cornell’s first president, Andrew Dickson White, to hold his personal collection after he donated it to the university. It currently holds books on the history of the book and publishing. In an underground addition is the “Cocktail Lounge,” a unique 24-hour study area where contemporary design meets the Richardsonian Romanesque style. ", rateL: "Rate:", rate: "____", link: "https://olinuris.library.cornell.edu/quiet-group-study-spaces", canReserve: true,star: false, id : 2, map_image : "", open_hour : 0, close_hour : 0)
        let mann = Library(picture: "mann", name: "Mann Library", addressLabel: "237 Mann Dr", description: "Albert R. Mann Library is an open, trusted and welcoming home for research and discovery in the life sciences, agriculture, applied social sciences and human ecology. As a New York State land-grant library, we actively support the needs of all who seek knowledge and foster the open exchange of diverse ideas to improve the lives of people everywhere. Recognizing that the information landscape is ever changing, we preserve knowledge and strive to be innovative in our approach to its dissemination and in service to our patrons, particularly our partners in the College of Agriculture and Life Sciences and College of Human Ecology.", rateL: "Rate:", rate: "____", link:"https://mann.library.cornell.edu/find-a-space", canReserve: true,star: false, id : 3, map_image : "", open_hour : 0, close_hour : 0)
        let cath = Library(picture: "Cath", name: "Catherwood Library", addressLabel: "521 Ives Hall", description: "The Martin P. Catherwood Library in Cornell University’s ILR School is the most comprehensive resource on labor and employment in North America. The ILR School was established by an act of the New York State Legislature in 1944. The Temporary Board of Trustees mandated “the provision of information” as one of three core services, declaring that “it will be essential to develop at the earliest possible moment a comprehensive library.” Today, the Catherwood Library is a service-oriented organization, offering expert research support through reference services, instruction, online guides, and access to premier collections. The collection consists of 250,000 volumes and 1500 serial subscriptions along with essential academic and practitioner databases and special format materials such as media and microforms. ILR collection strengths are in the areas of labor and employment, including collective bargaining, human resource studies, international and comparative industrial relations, labor disputes and history, labor economics, organizational behavior, and trade union issues. While many of these resources are academic in origin, Catherwood also collects directly from unions, corporations, governments, and non-profit organizations.",rateL: "Rate:", rate: "____", link:"https://catherwood.library.cornell.edu/use-the-library/", canReserve: true,star: false, id : 4, map_image : "",open_hour : 0, close_hour : 0)
        let archy = Library(picture: "archy", name: "Mui Ho Fine Arts Library", addressLabel: "947 University Ave", description: "One of the largest academic art and architecture libraries in the Northeast, the Mui Ho Fine Arts Library offers an ever-expanding collection of materials on architecture, art, city and regional planning, landscape architecture, and photography in various formats and in multiple languages. Housed in the library and at the Annex, our collection grows by approximately 4,000 titles each year and comprises more than 267,000 volumes and subscriptions to more than 850 periodical titles. In print and online, we provide discipline-focused resources to search for publications, including the Avery Index to Architectural Periodicals, Urban Studies Abstracts, and Art & Architecture Source. We license various image collections from Artstor, and provide access to thousands of Cornell’s digital images.", rateL: "Rate:", rate: "____", link: "N/A", canReserve: false,star: false, id : 5, map_image : "",open_hour : 0, close_hour : 0)
        let hotel = Library(picture: "hotel", name: "Nestlé Library", addressLabel: "G80 Statler Hall", description: "The Nestlé Library provides valuable research support to students, faculty, and all other members of the School of Hotel Administration (SHA) community. With specialized knowledge of all aspects of the hospitality and real estate industry, library staff are dedicated to serving the educational interests of the students, and the research and teaching interests of the school’s faculty. Organized shortly after the founding of the program in hospitality management at Cornell University in 1922, the library is an integral part of the school. The library contributes to the creation and dissemination of knowledge in the hospitality industry by connecting faculty members, students, and industry executives with hospitality industry information resources.", rateL: "Rate:", rate: "____", link:"N/A",canReserve: false,star: false, id : 6, map_image : "", open_hour : 0, close_hour : 0)
        let math = Library(picture: "math", name: "Math Library", addressLabel: "420 Mallott Hall", description: "The Math Library supports research and instruction in mathematics and statistics for the Cornell community. The collection consists of works on mathematics, statistics, applied mathematics, mathematics education and the history of mathematics. It also has materials for instructional and career needs as well as popular, expository and recreational literature of a mathematical nature.", rateL: "Rate:", rate: "____", link: "https://mathematics.library.cornell.edu/facilities/", canReserve: true,star: false, id : 7,  map_image : "", open_hour : 0, close_hour : 0)
        let music = Library(picture: "music", name: "Sydney Cox Library", addressLabel: "101 Lincoln Hall", description: "Located on the second and third floors of Lincoln Hall, the Sidney Cox Library of Music and Dance provides listening and viewing facilities, workstations, laptops, and wireless Internet access, as well as a variety of study spaces. As the music collections grew, space in Lincoln Hall became more crowded.  The stacks were closed, with materials paged by student assistants, and user seating was limited.  After a long fund-raising campaign, Lincoln Hall was renovated and expanded, reopening in Fall 2000.  The renovation increased Music Library space by some 70%, providing ample and much-needed study space, and allowing most of the collection to be housed in open stacks.  In honor of a major contribution to the renovation, the Music Library was named in honor of Sidney Cox (’47; MA’48; 1922-2005), a composer, collector, and long-time supporter of the Music Department.", rateL: "Rate:", rate: "____", link:"https://music.library.cornell.edu/use-the-library/", canReserve: true,star: false, id : 8,  map_image : "", open_hour : 0, close_hour : 0)
        let law = Library(picture: "law", name: "Law Library", addressLabel: "Cornell Law School, Floor 2", description: "Through creative services and strategic partnerships, Cornell University Law Library advances excellence in legal scholarship, research, and teaching.", rateL: "Rate:", rate: "____", link:"https://law.library.cornell.edu/find-a-study-space/", canReserve: true,star: false, id : 9, map_image : "", open_hour : 0, close_hour : 0)

        libs = [olin,uris,mann,cath,archy,hotel,math,music,law]

//        NetworkManager.getLibraries { libraries in
//            self.libs = libraries
//            self.LibraryTableView.reloadData()
//        }
        
        LibraryTableView.translatesAutoresizingMaskIntoConstraints = false
        LibraryTableView.backgroundColor = .white
        LibraryTableView.dataSource = self
        LibraryTableView.delegate = self
        LibraryTableView.register(LibraryTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(LibraryTableView)
        
        setupContstraints()
        
    }
    func setupContstraints(){
        NSLayoutConstraint.activate([
            LibraryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            LibraryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            LibraryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            LibraryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = LibraryTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? LibraryTableViewCell{
            cell.configure(lib: libs[indexPath.row])
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = LibraryTableView.cellForRow(at: indexPath)as! LibraryTableViewCell
        present(LibraryViewController(lib: libs[indexPath.row], delegate: cell), animated: true)
    }
}

