//
//  CatsTests.swift
//  CatsTests
//
//  Created by Andres Carrillo on 21/10/20.
//

import XCTest
@testable import Cats

class CatsTests: XCTestCase {
    
    var catImagesRepository: CatImagesRepository!
    var breedsRepository: BreedsRepository!
    
    override func setUp() {
        super.setUp()
        catImagesRepository = CatImagesRepository(CatImagesLocalMock(), CatImagesMockService())
        breedsRepository = BreedsRepository(BreedsMockService())
    }
    
    override func tearDown() {
        catImagesRepository = nil
        breedsRepository = nil
        super.tearDown()
    }
    
    func testCatRandomImageSuccessResponse() {
        //given
        var expectedBreedImages: [ImageBreed]?
        let promise = expectation(description: "get random cat images")
        
        //when
        catImagesRepository.fetchRandomImages(completion: { result in
            switch result {
            case .success(let images):
                expectedBreedImages = images
                promise.fulfill()
            case .failure(_):
                XCTFail()
            }
        })
        wait(for: [promise], timeout: 1.0)
        
        //then
        XCTAssertNotNil(expectedBreedImages)
    }
    
    func testCatImageBreedSuccessResponse() {
        //given
        var imageURL: String?
        let breedId = "validBreedId"
        let expectedURL = "https://www.google.com/gatos_meow"
        let promise = expectation(description: "get a cat breed image")
        
        //when
        catImagesRepository.fetchBreedImage(breedId, completion: { result in
            switch result {
            case .success(let image):
                imageURL = image[0].url
                promise.fulfill()
            case .failure(_):
                XCTFail()
            }
        })
        wait(for: [promise], timeout: 1.0)
        
        //then
        XCTAssertEqual(imageURL, expectedURL)
    }
    
    func testCatImageBreedUnsuccessResponse() {
        //given
        var errorMessage: String?
        let breedId = "Invalid_ID"
        let expectedMessageError = "Ups.  Something went wrong:(.  Try later."
        let promise = expectation(description: "invalid breed id to get a breed image")
        
        //when
        catImagesRepository.fetchBreedImage(breedId, completion: { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                errorMessage = error.rawValue
                promise.fulfill()
            }
        })
        wait(for: [promise], timeout: 1.0)
        
        //then
        XCTAssertEqual(errorMessage, expectedMessageError)
    }
    
    func testGetAllLocalVotes() {
        //given
        var votes: [Vote]?
        
        //when
        votes = catImagesRepository.getAllVotes()
        
        //then
        XCTAssertNotNil(votes)
    }
    
    func testInvalidTypeOfVote() {
        let typeOfVote: TypeOfVote? = TypeOfVote(rawValue: "whatever") ?? .none
        XCTAssertNil(typeOfVote)
    }
    
    func testSaveVoteToLocal_WhenURLIsEmpty() {
        let vote = Vote(name: "Mi Fav 1", date: nil, imageURL: "", kind: .like)
        XCTAssertFalse(catImagesRepository.saveVote(vote))
    }
    
    func testSaveVoteToLocal_WhenNameIsEmpty() {
        let vote = Vote(name: "", date: nil, imageURL: "https://cat.catico.co", kind: .like)
        XCTAssertFalse(catImagesRepository.saveVote(vote))
    }
    
    func testGetListOfBreedsSuccessResponse() {
        //given
        var expectedBreeds: [Breed]?
        let promise = expectation(description: "get list of breeds")
        
        //when
        breedsRepository.fetchBreeds { result in
            switch result {
            case .success(let breeds):
                expectedBreeds = breeds
                promise.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [promise], timeout: 3.0)
        
        //then
        XCTAssertNotNil(expectedBreeds)
    }
    
}
