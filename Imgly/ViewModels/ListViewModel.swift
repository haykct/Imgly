//
//  ListViewModel.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import Combine

final class ListViewModel: ObservableObject {
    // MARK: Public properties

    @Published var listItems: [ListModel] = []

    // MARK: Private properties

    @Injected private var networkService: NetworkService
    private var cancellable: AnyCancellable?

    // MARK: Public properties

    func requestListData() {
        let request = ListRequest()

        cancellable = networkService.request(request)
            .sink { completion in
                guard case let .failure(error) = completion else { return }
                //Handle error
            } receiveValue: { [unowned self] items in
                listItems = items
            }
    }
}
