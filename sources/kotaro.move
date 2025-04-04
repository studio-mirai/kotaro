module kotaro::kotaro;

use sui::package;

public struct KOTARO has drop {}

public struct Kotaro has key, store {
    id: UID,
}

fun init(otw: KOTARO, ctx: &mut TxContext) {
    package::claim_and_keep(otw, ctx);
}

public fun new(ctx: &mut TxContext): Kotaro {
    Kotaro {
        id: object::new(ctx),
    }
}

public fun new_bulk(quantity: u64, ctx: &mut TxContext): vector<Kotaro> {
    vector::tabulate!(quantity, |_| new(ctx))
}

public fun destroy(kotaro: Kotaro) {
    let Kotaro { id } = kotaro;
    id.delete();
}
