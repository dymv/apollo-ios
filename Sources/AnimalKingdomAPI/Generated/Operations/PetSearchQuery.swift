// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public class PetSearchQuery: GraphQLQuery {
  public let operationName: String = "PetSearch"
  public let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query PetSearch($filters: PetSearchFilters = {species: ["Dog", "Cat"], size: SMALL, measurements: {height: 10.5, weight: 5.0}}) {
        pets(filters: $filters) {
          id
          humanName
        }
      }
      """
    ))

  public var filters: GraphQLNullable<PetSearchFilters>

  public enum DefaultVariables {
    public static let filters: GraphQLNullable<PetSearchFilters> = .some(PetSearchFilters(
      species: ["Dog", "Cat"],
      size: .some(.case(.SMALL)),
      measurements: .some(MeasurementsInput(
        height: 10.5,
        weight: 5.0
      ))))
  }

  public init(filters: GraphQLNullable<PetSearchFilters> = DefaultVariables.filters) {
    self.filters = filters
  }

  public var variables: Variables? {
    ["filters": filters]
  }

  public struct Data: AnimalKingdomAPI.SelectionSet {
    public let data: DataDict
    public init(data: DataDict) { self.data = data }

    public static var __parentType: ParentType { .Object(AnimalKingdomAPI.Query.self) }
    public static var selections: [Selection] { [
      .field("pets", [Pet].self),
    ] }

    public var pets: [Pet] { data["pets"] }

    /// Pet
    public struct Pet: AnimalKingdomAPI.SelectionSet {
      public let data: DataDict
      public init(data: DataDict) { self.data = data }

      public static var __parentType: ParentType { .Interface(AnimalKingdomAPI.Pet.self) }
      public static var selections: [Selection] { [
        .field("id", ID.self),
        .field("humanName", String?.self),
      ] }

      public var id: ID { data["id"] }
      public var humanName: String? { data["humanName"] }
    }
  }
}
