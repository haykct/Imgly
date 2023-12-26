//
//  EntryDetailViewModel.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 25.12.23.
//

import Combine

final class EntryDetailViewModel: ObservableObject {
    // MARK: Public properties

    @Published var viewData: EntryDetailViewData?
    @Published var networkError: NetworkError?

    // MARK: Private properties

    @Injected private var networkService: NetworkService
    private let id: String
    private var cancellable: AnyCancellable?

    // MARK: Initializers

    init(id: String) {
        self.id = id
    }

    // MARK: Public methods

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
