% Assemblies with quantity
assembly(computer, processor, 1).
assembly(computer, memory, 2).
assembly(computer, storage, 1).
assembly(computer, peripherals, 1).

assembly(processor, cpu, 1).
assembly(processor, cooler, 1).
assembly(processor, thermal_paste, 1).

assembly(memory, ram, 4).
assembly(memory, cache, 1).
assembly(memory, controller, 1).

assembly(storage, hdd, 1).
assembly(storage, ssd, 1).
assembly(storage, optical_drive, 1).

assembly(peripherals, monitor, 1).
assembly(peripherals, keyboard, 1).
assembly(peripherals, mouse, 1).

% Components relationship
components(Part, Subpart, Quantity) :- assembly(Part, Subpart, Quantity).
components(Part, Subpart, Quantity) :- assembly(Part, Intermediate, Qty1), 
                                       components(Intermediate, Subpart, Qty2),
                                       Quantity is Qty1 * Qty2.
