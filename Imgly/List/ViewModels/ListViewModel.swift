//
//  ListViewModel.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

import Combine

final class ListViewModel: ObservableObject {
    // MARK: Public properties

    // Declared listItems as an optional to prevent spinner becoming
    // visible again after deleting all items in list.
    /// A datasource that shows the data in ListContentView.
    @Published var listItems: [ListModel]?
    /// A property that notifies anbout network errors.
    @Published var networkError: NetworkError?

    // MARK: Private properties

    /// A service for sending network requests.
    @Injected private var networkService: NetworkService
    private var cancellable: AnyCancellable?

    // MARK: Public methods

    ///  A method that asynchronously fetches data from the network.
    ///  After getting the data it notifies the ListView.
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
