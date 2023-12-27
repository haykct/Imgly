//
//  EntryDetailViewModel.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import Combine

final class EntryDetailViewModel: ObservableObject {
    // MARK: Public properties

    /// A datasource that shows the data in EntryDetailContentView.
    @Published var viewData: EntryDetailViewData?
    /// A property that notifies about network errors.
    @Published var networkError: NetworkError?

    // MARK: Private properties

    /// A service for sending network requests.
    @Injected private var networkService: NetworkService
    /// Entry id.
    private let id: String
    private var cancellable: AnyCancellable?

    // MARK: Initializers

    init(id: String) {
        self.id = id
    }

    // MARK: Public methods

    ///  A method that asynchronously fetches data from the network.
    ///  After getting the data it notifies the EntryDetailView.
    func requestDetailData() {
        let request = EntryDetailRequest(id: id)

        cancellable = networkService.request(request)
            .sink { [unowned self] completion in
                guard case let .failure(error) = completion else { return }

                networkError = error
            } receiveValue: { [unowned self] detail in
                viewData = EntryDetailViewData.makeViewData(model: detail)
            }
    }
}
