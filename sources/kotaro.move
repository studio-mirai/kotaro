module kotaro::kotaro;

public struct Kotaro has key, store {
    id: UID,
}

public fun new(ctx: &mut TxContext): Kotaro {
    Kotaro {
        id: object::new(ctx),
    }
}

public fun new_bulk(ctx: &mut TxContext, quantity: u64): vector<Kotaro> {
    vector::tabulate!(quantity, |_| new(ctx))
}

public fun destroy(kotaro: Kotaro) {
    let Kotaro { id } = kotaro;
    id.delete();
}
