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
    @Published var networkError: NetworkError?

    // MARK: Private properties

    @Injected private var networkService: NetworkService
    private var cancellable: AnyCancellable?

    // MARK: Public methods

    func requestListData() {
        let request = ListRequest()

        cancellable = networkService.request(request)
            .sink { [unowned self] completion in
                guard case let .failure(error) = completion else { return }

                networkError = error
            } receiveValue: { [unowned self] items in
                listItems = items
            }
    }
}
