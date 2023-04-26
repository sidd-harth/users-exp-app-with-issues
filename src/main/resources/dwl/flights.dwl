%dw 2.0
output application/json
---
payload map ( payload01 , indexOfPayload01 ) -> {
	id: payload01.ID,
	airline: upper(payload01.airlineName default ""),
	destination: payload01.toAirport default "",
	current: payload01.fromAirport default "",
	price: "\$" ++ payload01.price default 0
}