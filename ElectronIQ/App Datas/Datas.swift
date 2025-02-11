//
//  Datas.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 07/11/24.
//
import SwiftUI
let elementsNames : [String] = ["Hydrogen", "Helium", "Lithium", "Beryllium", "Boron",
    "Carbon", "Nitrogen", "Oxygen", "Fluorine", "Neon",
    "Sodium", "Magnesium", "Aluminum", "Silicon", "Phosphorus",
    "Sulfur", "Chlorine", "Argon", "Potassium", "Calcium",
    "Scandium", "Titanium", "Vanadium", "Chromium", "Manganese",
    "Iron", "Cobalt", "Nickel", "Copper", "Zinc",
    "Gallium", "Germanium", "Arsenic", "Selenium", "Bromine",
    "Krypton", "Rubidium", "Strontium", "Yttrium", "Zirconium",
    "Niobium", "Molybdenum", "Technetium", "Ruthenium", "Rhodium",
    "Palladium", "Silver", "Cadmium", "Indium", "Tin",
    "Antimony", "Tellurium", "Iodine", "Xenon", "Cesium",
    "Barium", "Lanthanum", "Cerium", "Praseodymium", "Neodymium",
    "Promethium", "Samarium", "Europium", "Gadolinium", "Terbium",
    "Dysprosium", "Holmium", "Erbium", "Thulium", "Ytterbium",
    "Lutetium", "Hafnium", "Tantalum", "Tungsten", "Rhenium",
    "Osmium", "Iridium", "Platinum", "Gold", "Mercury",
    "Thallium", "Lead", "Bismuth", "Polonium", "Astatine",
    "Radon", "Francium", "Radium", "Actinium", "Thorium",
    "Protactinium", "Uranium", "Neptunium", "Plutonium", "Americium",
    "Curium", "Berkelium", "Californium", "Einsteinium", "Fermium",
    "Mendelevium", "Nobelium", "Lawrencium"
]
// print(elementsNames.count)
 let elementsNumber : [Int] = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
    31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
    51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
    61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
    71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
    81, 82, 83, 84, 85, 86, 87, 88, 89, 90,
    91, 92, 93, 94, 95, 96, 97, 98, 99, 100,
    101, 102, 103
]

let elementsMassNo : [Double] = [
    1.00794, 4.002602, 6.941, 9.012182, 10.811, 12.0107, 14.0067, 15.9994, 18.9984032, 20.1797,
    22.98976928, 24.305, 26.9815386, 28.0855, 30.973762, 32.065, 35.453, 39.948, 39.0983, 40.078,
    44.955912, 47.867, 50.9415, 51.9961, 54.938045, 55.845, 58.933195, 58.6934, 63.546, 65.38,
    69.723, 72.64, 74.92160, 78.96, 79.904, 83.798, 85.4678, 87.62, 88.90585, 91.224,
    92.90638, 95.96, 98.0, 101.07, 102.90550, 106.42, 107.8682, 112.411, 114.818, 118.710,
    121.760, 127.60, 126.90447, 131.293, 132.9054519, 137.327, 138.90547, 140.116, 140.90765, 144.242,
    145.0, 150.36, 151.964, 157.25, 158.92535, 162.500, 164.93032, 167.259, 168.93421, 173.04,
    174.9668, 178.49, 180.94788, 183.84, 186.207, 190.23, 192.217, 195.084, 196.966569, 200.59,
    204.3833, 207.2, 208.98040, 209.0, 210.0, 222.0, 223.0, 226.0, 227.0, 232.03806,
    231.03588, 238.02891, 237.0, 244.0, 243.0, 247.0, 247.0, 251.0, 252.0, 257.0,
    258.0, 259.0, 262.0
]
// print(elementsMassNo.count)

let elementsSymbols: [String] = [
    "H", "He", "Li", "Be", "B", "C", "N", "O", "F", "Ne",
    "Na", "Mg", "Al", "Si", "P", "S", "Cl", "Ar", "K", "Ca",
    "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn",
    "Ga", "Ge", "As", "Se", "Br", "Kr", "Rb", "Sr", "Y", "Zr",
    "Nb", "Mo", "Tc", "Ru", "Rh", "Pd", "Ag", "Cd", "In", "Sn",
    "Sb", "Te", "I", "Xe", "Cs", "Ba", "La", "Ce", "Pr", "Nd",
    "Pm", "Sm", "Eu", "Gd", "Tb", "Dy", "Ho", "Er", "Tm", "Yb",
    "Lu", "Hf", "Ta", "W", "Re", "Os", "Ir", "Pt", "Au", "Hg",
    "Tl", "Pb", "Bi", "Po", "At", "Rn", "Fr", "Ra", "Ac", "Th",
    "Pa", "U", "Np", "Pu", "Am", "Cm", "Bk", "Cf", "Es", "Fm",
    "Md", "No", "Lr"
]

let elementCardColor:[Color] = [
    .nonMetals,
    .nobleGas,
    .alkaliMetals,
    .alkalineEarthMetals,
    .metalloids,
    .nonMetals,
    .nonMetals,
    .nonMetals,
    .nonMetals,
    .nobleGas,
    .alkaliMetals,
    .alkalineEarthMetals,
    .postTransistionMetals,
    .metalloids,
    .nonMetals,
    .nonMetals,
    .nonMetals,
    .nobleGas,
    .alkaliMetals,
    .alkalineEarthMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .postTransistionMetals,
    .metalloids,
    .metalloids,
    .nonMetals,
    .nonMetals,
    .nobleGas,
    .alkaliMetals,
    .alkalineEarthMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .postTransistionMetals,
    .postTransistionMetals,
    .metalloids,
    .metalloids,
    .nonMetals,
    .nobleGas,
    .alkaliMetals,
    .alkalineEarthMetals,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .lanthanoid,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .transistionMetals,
    .postTransistionMetals,
    .postTransistionMetals,
    .postTransistionMetals,
    .postTransistionMetals,
    .metalloids,
    .nobleGas,
    .alkaliMetals,
    .alkalineEarthMetals,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    .actinoid,
    
]





let electronicConfiguration : [[Int]] = [
     [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 6, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 7, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 5, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 4, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 5, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 6, 0, 0, 0, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 6, 0, 0, 1, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 0, 2, 6, 1, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 1, 2, 6, 1, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 3, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 4, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 5, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 6, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 7, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 7, 2, 6, 1, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 9, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 10, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 11, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 12, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 13, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 0, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 1, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 2, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 3, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 4, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 5, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 6, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 7, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 9, 0, 1, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 1, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 0, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 1, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 2, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 3, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 4, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 5, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 6, 0, 0, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 6, 0, 1, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 6, 0, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 6, 1, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 0, 2, 6, 2, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 2, 2, 6, 1, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 3, 2, 6, 1, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 4, 2, 6, 1, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 6, 2, 6, 0, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 7, 2, 6, 0, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 7, 2, 6, 1, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 9, 2, 6, 0, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 10, 2, 6, 0, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 11, 2, 6, 0, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 12, 2, 6, 0, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 13, 2, 6, 0, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 14, 2, 6, 0, 2, 0],
     [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 14, 2, 6, 0, 2, 1]
    ]


let neutrons: [Int] = [
    0,    // Hydrogen (H) - Most common isotope is H-1
    2,    // Helium (He) - Most common isotope is He-4
    4,    // Lithium (Li) - Most common isotope is Li-7
    5,    // Beryllium (Be) - Be-9 is the only stable isotope
    6,    // Boron (B) - Most common isotope is B-11
    6,    // Carbon (C) - Most common isotope is C-12
    7,    // Nitrogen (N) - Most common isotope is N-14
    8,    // Oxygen (O) - Most common isotope is O-16
    10,   // Fluorine (F) - F-19 is the only stable isotope
    10,   // Neon (Ne) - Most common isotope is Ne-20
    12,   // Sodium (Na) - Na-23 is the only stable isotope
    12,   // Magnesium (Mg) - Most common isotope is Mg-24
    14,   // Aluminum (Al) - Al-27 is the only stable isotope
    14,   // Silicon (Si) - Most common isotope is Si-28
    16,   // Phosphorus (P) - P-31 is the only stable isotope
    16,   // Sulfur (S) - Most common isotope is S-32
    18,   // Chlorine (Cl) - Most common isotope is Cl-35
    22,   // Argon (Ar) - Most common isotope is Ar-40
    20,   // Potassium (K) - Most common isotope is K-39
    20,   // Calcium (Ca) - Most common isotope is Ca-40
    24,   // Scandium (Sc) - Sc-45 is the only stable isotope
    26,   // Titanium (Ti) - Most common isotope is Ti-48
    28,   // Vanadium (V) - Most common isotope is V-51
    28,   // Chromium (Cr) - Most common isotope is Cr-52
    30,   // Manganese (Mn) - Mn-55 is the only stable isotope
    30,   // Iron (Fe) - Most common isotope is Fe-56
    32,   // Cobalt (Co) - Co-59 is the only stable isotope
    30,   // Nickel (Ni) - Most common isotope is Ni-58
    34,   // Copper (Cu) - Most common isotope is Cu-63
    34,   // Zinc (Zn) - Most common isotope is Zn-64
    39,   // Gallium (Ga) - Most common isotope is Ga-69
    42,   // Germanium (Ge) - Most common isotope is Ge-74
    42,   // Arsenic (As) - As-75 is the only stable isotope
    45,   // Selenium (Se) - Most common isotope is Se-80
    44,   // Bromine (Br) - Most common isotope is Br-79
    48,   // Krypton (Kr) - Most common isotope is Kr-84
    48,   // Rubidium (Rb) - Most common isotope is Rb-85
    50,   // Strontium (Sr) - Most common isotope is Sr-88
    50,   // Yttrium (Y) - Y-89 is the only stable isotope
    50,   // Zirconium (Zr) - Most common isotope is Zr-90
    52,   // Niobium (Nb) - Nb-93 is the only stable isotope
    52,   // Molybdenum (Mo) - Most common isotope is Mo-98
    55,   // Technetium (Tc) - Most common isotope is Tc-98
    57,   // Ruthenium (Ru) - Most common isotope is Ru-101
    58,   // Rhodium (Rh) - Rh-103 is the only stable isotope
    60,   // Palladium (Pd) - Most common isotope is Pd-106
    61,   // Silver (Ag) - Most common isotope is Ag-107
    64,   // Cadmium (Cd) - Most common isotope is Cd-114
    66,   // Indium (In) - Most common isotope is In-115
    69,   // Tin (Sn) - Most common isotope is Sn-120
    71,   // Antimony (Sb) - Most common isotope is Sb-121
    76,   // Tellurium (Te) - Most common isotope is Te-130
    74,   // Iodine (I) - I-127 is the only stable isotope
    77,   // Xenon (Xe) - Most common isotope is Xe-132
    78,   // Cesium (Cs) - Cs-133 is the only stable isotope
    82,   // Barium (Ba) - Most common isotope is Ba-138
    82,   // Lanthanum (La) - Most common isotope is La-139
    82,   // Cerium (Ce) - Most common isotope is Ce-140
    82,   // Praseodymium (Pr) - Pr-141 is the only stable isotope
    82,   // Neodymium (Nd) - Most common isotope is Nd-142
    84,   // Promethium (Pm) - Most common isotope is Pm-145
    88,   // Samarium (Sm) - Most common isotope is Sm-152
    89,   // Europium (Eu) - Most common isotope is Eu-153
    93,   // Gadolinium (Gd) - Most common isotope is Gd-158
    94,   // Terbium (Tb) - Tb-159 is the only stable isotope
    97,   // Dysprosium (Dy) - Most common isotope is Dy-164
    98,   // Holmium (Ho) - Ho-165 is the only stable isotope
    99,   // Erbium (Er) - Most common isotope is Er-166
    100,  // Thulium (Tm) - Tm-169 is the only stable isotope
    103,  // Ytterbium (Yb) - Most common isotope is Yb-174
    104,  // Lutetium (Lu) - Most common isotope is Lu-175
    106,  // Hafnium (Hf) - Most common isotope is Hf-180
    108,  // Tantalum (Ta) - Most common isotope is Ta-181
    110,  // Tungsten (W) - Most common isotope is W-184
    111,  // Rhenium (Re) - Most common isotope is Re-187
    114,  // Osmium (Os) - Most common isotope is Os-192
    115,  // Iridium (Ir) - Most common isotope is Ir-193
    117,  // Platinum (Pt) - Most common isotope is Pt-195
    118,  // Gold (Au) - Au-197 is the only stable isotope
    121,  // Mercury (Hg) - Most common isotope is Hg-202
    123,  // Thallium (Tl) - Most common isotope is Tl-205
    125,  // Lead (Pb) - Most common isotope is Pb-208
    126,  // Bismuth (Bi) - Bi-209 is the only stable isotope
    126,  // Polonium (Po) - Most stable isotope is Po-209
    125,  // Astatine (At) - Most stable isotope is At-210
    136,  // Radon (Rn) - Most stable isotope is Rn-222
    136,  // Francium (Fr) - Most stable isotope is Fr-223
    138,  // Radium (Ra) - Most stable isotope is Ra-226
    138,  // Actinium (Ac) - Most stable isotope is Ac-227
    142,  // Thorium (Th) - Most common isotope is Th-232
    140,  // Protactinium (Pa) - Most stable isotope is Pa-231
    146,  // Uranium (U) - Most common isotope is U-238
    144,  // Neptunium (Np) - Most stable isotope is Np-237
    146,  // Plutonium (Pu) - Most stable isotope is Pu-244
    146,  // Americium (Am) - Most common isotope is Am-243
    151,  // Curium (Cm) - Most stable isotope is Cm-247
    150,  // Berkelium (Bk) - Most stable isotope is Bk-247
    153,  // Californium (Cf) - Most stable isotope is Cf-251
    153,  // Einsteinium (Es) - Most stable isotope is Es-252
    157,  // Fermium (Fm) - Most stable isotope is Fm-257
    157,  // Mendelevium (Md) - Most stable isotope is Md-258
    157,  // Nobelium (No) - Most stable isotope is No-259
    159   // Lawrencium (Lr) - Most stable isotope is Lr-262
]




let groups: [String] = [
    "Group 1 (Alkali Metals)",      // Hydrogen
    "Group 18 (Noble Gases)",      // Helium
    "Group 2 (Alkaline Earth Metals)", // Lithium
    "Group 2 (Alkaline Earth Metals)", // Beryllium
    "Group 13 (Boron Group)",       // Boron
    "Group 14 (Carbon Group)",      // Carbon
    "Group 15 (Pnictogens)",        // Nitrogen
    "Group 16 (Chalcogens)",        // Oxygen
    "Group 17 (Halogens)",          // Fluorine
    "Group 18 (Noble Gases)",       // Neon
    "Group 1 (Alkali Metals)",      // Sodium
    "Group 2 (Alkaline Earth Metals)", // Magnesium
    "Group 13 (Boron Group)",       // Aluminum
    "Group 14 (Carbon Group)",      // Silicon
    "Group 15 (Pnictogens)",        // Phosphorus
    "Group 16 (Chalcogens)",        // Sulfur
    "Group 17 (Halogens)",          // Chlorine
    "Group 18 (Noble Gases)",       // Argon
    "Group 1 (Alkali Metals)",      // Potassium
    "Group 2 (Alkaline Earth Metals)", // Calcium
    "Group 3 (Transition Metals)",  // Scandium
    "Group 4 (Transition Metals)",  // Titanium
    "Group 5 (Transition Metals)",  // Vanadium
    "Group 6 (Transition Metals)",  // Chromium
    "Group 7 (Transition Metals)",  // Manganese
    "Group 8 (Transition Metals)",  // Iron
    "Group 9 (Transition Metals)",  // Cobalt
    "Group 10 (Transition Metals)", // Nickel
    "Group 11 (Transition Metals)", // Copper
    "Group 12 (Transition Metals)", // Zinc
    "Group 13 (Boron Group)",       // Gallium
    "Group 14 (Carbon Group)",      // Germanium
    "Group 15 (Pnictogens)",        // Arsenic
    "Group 16 (Chalcogens)",        // Selenium
    "Group 17 (Halogens)",          // Bromine
    "Group 18 (Noble Gases)",       // Krypton
    "Group 1 (Alkali Metals)",      // Rubidium
    "Group 2 (Alkaline Earth Metals)", // Strontium
    "Group 3 (Transition Metals)",  // Yttrium
    "Group 4 (Transition Metals)",  // Zirconium
    "Group 5 (Transition Metals)",  // Niobium
    "Group 6 (Transition Metals)",  // Molybdenum
    "Group 7 (Transition Metals)",  // Technetium
    "Group 8 (Transition Metals)",  // Ruthenium
    "Group 9 (Transition Metals)",  // Rhodium
    "Group 10 (Transition Metals)", // Palladium
    "Group 11 (Transition Metals)", // Silver
    "Group 12 (Transition Metals)", // Cadmium
    "Group 13 (Boron Group)",       // Indium
    "Group 14 (Carbon Group)",      // Tin
    "Group 15 (Pnictogens)",        // Antimony
    "Group 16 (Chalcogens)",        // Tellurium
    "Group 17 (Halogens)",          // Iodine
    "Group 18 (Noble Gases)",       // Xenon
    "Group 1 (Alkali Metals)",      // Cesium
    "Group 2 (Alkaline Earth Metals)", // Barium
    "Lanthanides",                  // Lanthanum
    "Lanthanides",                  // Cerium
    "Lanthanides",                  // Praseodymium
    "Lanthanides",                  // Neodymium
    "Lanthanides",                  // Promethium
    "Lanthanides",                  // Samarium
    "Lanthanides",                  // Europium
    "Lanthanides",                  // Gadolinium
    "Lanthanides",                  // Terbium
    "Lanthanides",                  // Dysprosium
    "Lanthanides",                  // Holmium
    "Lanthanides",                  // Erbium
    "Lanthanides",                  // Thulium
    "Lanthanides",                  // Ytterbium
    "Lanthanides",                  // Lutetium
    "Group 4 (Transition Metals)",  // Hafnium
    "Group 5 (Transition Metals)",  // Tantalum
    "Group 6 (Transition Metals)",  // Tungsten
    "Group 7 (Transition Metals)",  // Rhenium
    "Group 8 (Transition Metals)",  // Osmium
    "Group 9 (Transition Metals)",  // Iridium
    "Group 10 (Transition Metals)", // Platinum
    "Group 11 (Transition Metals)", // Gold
    "Group 12 (Transition Metals)", // Mercury
    "Group 13 (Boron Group)",       // Thallium
    "Group 14 (Carbon Group)",      // Lead
    "Group 15 (Pnictogens)",        // Bismuth
    "Group 16 (Chalcogens)",        // Polonium
    "Group 17 (Halogens)",          // Astatine
    "Group 18 (Noble Gases)",       // Radon
    "Group 1 (Alkali Metals)",      // Francium
    "Group 2 (Alkaline Earth Metals)", // Radium
    "Actinides",                    // Actinium
    "Actinides",                    // Thorium
    "Actinides",                    // Protactinium
    "Actinides",                    // Uranium
    "Actinides",                    // Neptunium
    "Actinides",                    // Plutonium
    "Actinides",                    // Americium
    "Actinides",                    // Curium
    "Actinides",                    // Berkelium
    "Actinides",                    // Californium
    "Actinides",                    // Einsteinium
    "Actinides",                    // Fermium
    "Actinides",                    // Mendelevium
    "Actinides",                    // Nobelium
    "Actinides"                     // Lawrencium
]


let periods: [String] = [
    "Period 1",      // Hydrogen
    "Period 1",      // Helium
    "Period 2",      // Lithium
    "Period 2",      // Beryllium
    "Period 2",      // Boron
    "Period 2",      // Carbon
    "Period 2",      // Nitrogen
    "Period 2",      // Oxygen
    "Period 2",      // Fluorine
    "Period 2",      // Neon
    "Period 3",      // Sodium
    "Period 3",      // Magnesium
    "Period 3",      // Aluminum
    "Period 3",      // Silicon
    "Period 3",      // Phosphorus
    "Period 3",      // Sulfur
    "Period 3",      // Chlorine
    "Period 3",      // Argon
    "Period 4",      // Potassium
    "Period 4",      // Calcium
    "Period 4",      // Scandium
    "Period 4",      // Titanium
    "Period 4",      // Vanadium
    "Period 4",      // Chromium
    "Period 4",      // Manganese
    "Period 4",      // Iron
    "Period 4",      // Cobalt
    "Period 4",      // Nickel
    "Period 4",      // Copper
    "Period 4",      // Zinc
    "Period 4",      // Gallium
    "Period 4",      // Germanium
    "Period 4",      // Arsenic
    "Period 4",      // Selenium
    "Period 4",      // Bromine
    "Period 4",      // Krypton
    "Period 5",      // Rubidium
    "Period 5",      // Strontium
    "Period 5",      // Yttrium
    "Period 5",      // Zirconium
    "Period 5",      // Niobium
    "Period 5",      // Molybdenum
    "Period 5",      // Technetium
    "Period 5",      // Ruthenium
    "Period 5",      // Rhodium
    "Period 5",      // Palladium
    "Period 5",      // Silver
    "Period 5",      // Cadmium
    "Period 5",      // Indium
    "Period 5",      // Tin
    "Period 5",      // Antimony
    "Period 5",      // Tellurium
    "Period 5",      // Iodine
    "Period 5",      // Xenon
    "Period 6",      // Cesium
    "Period 6",      // Barium
    "Period 6",      // Lanthanum
    "Period 6",      // Cerium
    "Period 6",      // Praseodymium
    "Period 6",      // Neodymium
    "Period 6",      // Promethium
    "Period 6",      // Samarium
    "Period 6",      // Europium
    "Period 6",      // Gadolinium
    "Period 6",      // Terbium
    "Period 6",      // Dysprosium
    "Period 6",      // Holmium
    "Period 6",      // Erbium
    "Period 6",      // Thulium
    "Period 6",      // Ytterbium
    "Period 6",      // Lutetium
    "Period 6",      // Hafnium
    "Period 6",      // Tantalum
    "Period 6",      // Tungsten
    "Period 6",      // Rhenium
    "Period 6",      // Osmium
    "Period 6",      // Iridium
    "Period 6",      // Platinum
    "Period 6",      // Gold
    "Period 6",      // Mercury
    "Period 6",      // Thallium
    "Period 6",      // Lead
    "Period 6",      // Bismuth
    "Period 6",      // Polonium
    "Period 6",      // Astatine
    "Period 6",      // Radon
    "Period 7",      // Francium
    "Period 7",      // Radium
    "Period 7",      // Actinium
    "Period 7",      // Thorium
    "Period 7",      // Protactinium
    "Period 7",      // Uranium
    "Period 7",      // Neptunium
    "Period 7",      // Plutonium
    "Period 7",      // Americium
    "Period 7",      // Curium
    "Period 7",      // Berkelium
    "Period 7",      // Californium
    "Period 7",      // Einsteinium
    "Period 7",      // Fermium
    "Period 7",      // Mendelevium
    "Period 7",      // Nobelium
    "Period 7"       // Lawrencium
]


let blocks: [String] = [
    "s-block",      // Hydrogen
    "s-block",      // Helium
    "s-block",      // Lithium
    "s-block",      // Beryllium
    "p-block",      // Boron
    "p-block",      // Carbon
    "p-block",      // Nitrogen
    "p-block",      // Oxygen
    "p-block",      // Fluorine
    "p-block",      // Neon
    "s-block",      // Sodium
    "s-block",      // Magnesium
    "p-block",      // Aluminum
    "p-block",      // Silicon
    "p-block",      // Phosphorus
    "p-block",      // Sulfur
    "p-block",      // Chlorine
    "p-block",      // Argon
    "s-block",      // Potassium
    "s-block",      // Calcium
    "d-block",      // Scandium
    "d-block",      // Titanium
    "d-block",      // Vanadium
    "d-block",      // Chromium
    "d-block",      // Manganese
    "d-block",      // Iron
    "d-block",      // Cobalt
    "d-block",      // Nickel
    "d-block",      // Copper
    "d-block",      // Zinc
    "p-block",      // Gallium
    "p-block",      // Germanium
    "p-block",      // Arsenic
    "p-block",      // Selenium
    "p-block",      // Bromine
    "p-block",      // Krypton
    "s-block",      // Rubidium
    "s-block",      // Strontium
    "d-block",      // Yttrium
    "d-block",      // Zirconium
    "d-block",      // Niobium
    "d-block",      // Molybdenum
    "d-block",      // Technetium
    "d-block",      // Ruthenium
    "d-block",      // Rhodium
    "d-block",      // Palladium
    "d-block",      // Silver
    "d-block",      // Cadmium
    "p-block",      // Indium
    "p-block",      // Tin
    "p-block",      // Antimony
    "p-block",      // Tellurium
    "p-block",      // Iodine
    "p-block",      // Xenon
    "s-block",      // Cesium
    "s-block",      // Barium
    "f-block",      // Lanthanum
    "f-block",      // Cerium
    "f-block",      // Praseodymium
    "f-block",      // Neodymium
    "f-block",      // Promethium
    "f-block",      // Samarium
    "f-block",      // Europium
    "f-block",      // Gadolinium
    "f-block",      // Terbium
    "f-block",      // Dysprosium
    "f-block",      // Holmium
    "f-block",      // Erbium
    "f-block",      // Thulium
    "f-block",      // Ytterbium
    "f-block",      // Lutetium
    "d-block",      // Hafnium
    "d-block",      // Tantalum
    "d-block",      // Tungsten
    "d-block",      // Rhenium
    "d-block",      // Osmium
    "d-block",      // Iridium
    "d-block",      // Platinum
    "d-block",      // Gold
    "d-block",      // Mercury
    "p-block",      // Thallium
    "p-block",      // Lead
    "p-block",      // Bismuth
    "p-block",      // Polonium
    "p-block",      // Astatine
    "p-block",      // Radon
    "s-block",      // Francium
    "s-block",      // Radium
    "f-block",      // Actinium
    "f-block",      // Thorium
    "f-block",      // Protactinium
    "f-block",      // Uranium
    "f-block",      // Neptunium
    "f-block",      // Plutonium
    "f-block",      // Americium
    "f-block",      // Curium
    "f-block",      // Berkelium
    "f-block",      // Californium
    "f-block",      // Einsteinium
    "f-block",      // Fermium
    "f-block",      // Mendelevium
    "f-block",      // Nobelium
    "f-block"       // Lawrencium
]

let electronicConfigurationContents: [String] = [
    "1s¹",                          // 1. Hydrogen
    "1s²",                          // 2. Helium
    "[He] 2s¹",                     // 3. Lithium
    "[He] 2s²",                     // 4. Beryllium
    "[He] 2s² 2p¹",                // 5. Boron
    "[He] 2s² 2p²",                // 6. Carbon
    "[He] 2s² 2p³",                // 7. Nitrogen
    "[He] 2s² 2p⁴",                // 8. Oxygen
    "[He] 2s² 2p⁵",                // 9. Fluorine
    "[He] 2s² 2p⁶",                // 10. Neon
    "[Ne] 3s¹",                     // 11. Sodium
    "[Ne] 3s²",                     // 12. Magnesium
    "[Ne] 3s² 3p¹",                // 13. Aluminum
    "[Ne] 3s² 3p²",                // 14. Silicon
    "[Ne] 3s² 3p³",                // 15. Phosphorus
    "[Ne] 3s² 3p⁴",                // 16. Sulfur
    "[Ne] 3s² 3p⁵",                // 17. Chlorine
    "[Ne] 3s² 3p⁶",                // 18. Argon
    "[Ar] 4s¹",                     // 19. Potassium
    "[Ar] 4s²",                     // 20. Calcium
    "[Ar] 3d¹ 4s²",                // 21. Scandium
    "[Ar] 3d² 4s²",                // 22. Titanium
    "[Ar] 3d³ 4s²",                // 23. Vanadium
    "[Ar] 3d⁵ 4s¹",                // 24. Chromium
    "[Ar] 3d⁵ 4s²",                // 25. Manganese
    "[Ar] 3d⁶ 4s²",                // 26. Iron
    "[Ar] 3d⁷ 4s²",                // 27. Cobalt
    "[Ar] 3d⁸ 4s²",                // 28. Nickel
    "[Ar] 3d¹⁰ 4s¹",               // 29. Copper
    "[Ar] 3d¹⁰ 4s²",               // 30. Zinc
    "[Ar] 3d¹⁰ 4s² 4p¹",           // 31. Gallium
    "[Ar] 3d¹⁰ 4s² 4p²",           // 32. Germanium
    "[Ar] 3d¹⁰ 4s² 4p³",           // 33. Arsenic
    "[Ar] 3d¹⁰ 4s² 4p⁴",           // 34. Selenium
    "[Ar] 3d¹⁰ 4s² 4p⁵",           // 35. Bromine
    "[Ar] 3d¹⁰ 4s² 4p⁶",           // 36. Krypton
    "[Kr] 5s¹",                     // 37. Rubidium
    "[Kr] 5s²",                     // 38. Strontium
    "[Kr] 4d¹ 5s²",                // 39. Yttrium
    "[Kr] 4d² 5s²",                // 40. Zirconium
    "[Kr] 4d⁴ 5s¹",                // 41. Niobium
    "[Kr] 4d⁵ 5s¹",                // 42. Molybdenum
    "[Kr] 4d⁵ 5s²",                // 43. Technetium
    "[Kr] 4d⁷ 5s¹",                // 44. Ruthenium
    "[Kr] 4d⁸ 5s¹",                // 45. Rhodium
    "[Kr] 4d¹⁰",                   // 46. Palladium
    "[Kr] 4d¹⁰ 5s¹",               // 47. Silver
    "[Kr] 4d¹⁰ 5s²",               // 48. Cadmium
    "[Kr] 4d¹⁰ 5s² 5p¹",           // 49. Indium
    "[Kr] 4d¹⁰ 5s² 5p²",           // 50. Tin
    "[Kr] 4d¹⁰ 5s² 5p³",           // 51. Antimony
    "[Kr] 4d¹⁰ 5s² 5p⁴",           // 52. Tellurium
    "[Kr] 4d¹⁰ 5s² 5p⁵",           // 53. Iodine
    "[Kr] 4d¹⁰ 5s² 5p⁶",           // 54. Xenon
    "[Xe] 6s¹",                     // 55. Cesium
    "[Xe] 6s²",                     // 56. Barium
    "[Xe] 5d¹ 6s²",                // 57. Lanthanum
    "[Xe] 4f¹ 5d¹ 6s²",            // 58. Cerium
    "[Xe] 4f³ 6s²",                // 59. Praseodymium
    "[Xe] 4f⁴ 6s²",                // 60. Neodymium
    "[Xe] 4f⁵ 6s²",                // 61. Promethium
    "[Xe] 4f⁶ 6s²",                // 62. Samarium
    "[Xe] 4f⁷ 6s²",                // 63. Europium
    "[Xe] 4f⁷ 5d¹ 6s²",            // 64. Gadolinium
    "[Xe] 4f⁹ 6s²",                // 65. Terbium
    "[Xe] 4f¹⁰ 6s²",               // 66. Dysprosium
    "[Xe] 4f¹¹ 6s²",               // 67. Holmium
    "[Xe] 4f¹² 6s²",               // 68. Erbium
    "[Xe] 4f¹³ 6s²",               // 69. Thulium
    "[Xe] 4f¹⁴ 6s²",               // 70. Ytterbium
    "[Xe] 4f¹⁴ 5d¹ 6s²",           // 71. Lutetium
    "[Xe] 4f¹⁴ 5d² 6s²",           // 72. Hafnium
    "[Xe] 4f¹⁴ 5d³ 6s²",           // 73. Tantalum
    "[Xe] 4f¹⁴ 5d⁴ 6s²",           // 74. Tungsten
    "[Xe] 4f¹⁴ 5d⁵ 6s²",           // 75. Rhenium
    "[Xe] 4f¹⁴ 5d⁶ 6s²",           // 76. Osmium
    "[Xe] 4f¹⁴ 5d⁷ 6s²",           // 77. Iridium
    "[Xe] 4f¹⁴ 5d⁹ 6s¹",           // 78. Platinum
    "[Xe] 4f¹⁴ 5d¹⁰ 6s¹",          // 79. Gold
    "[Xe] 4f¹⁴ 5d¹⁰ 6s²",          // 80. Mercury
    "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p¹",      // 81. Thallium
    "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p²",      // 82. Lead
    "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p³",      // 83. Bismuth
    "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁴",      // 84. Polonium
    "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁵",      // 85. Astatine
    "[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁶",      // 86. Radon
    "[Rn] 7s¹",                     // 87. Francium
    "[Rn] 7s²",                     // 88. Radium
    "[Rn] 6d¹ 7s²",                // 89. Actinium
    "[Rn] 6d² 7s²",                // 90. Thorium
    "[Rn] 5f² 6d¹ 7s²",            // 91. Protactinium
    "[Rn] 5f³ 6d¹ 7s²",            // 92. Uranium
    "[Rn] 5f⁴ 6d¹ 7s²",            // 93. Neptunium
    "[Rn] 5f⁶ 7s²",                // 94. Plutonium
    "[Rn] 5f⁷ 7s²",                // 95. Americium
    "[Rn] 5f⁷ 6d¹ 7s²",            // 96. Curium
    "[Rn] 5f⁹ 7s²",                // 97. Berkelium
    "[Rn] 5f¹⁰ 7s²",               // 98. Californium
    "[Rn] 5f¹¹ 7s²",               // 99. Einsteinium
    "[Rn] 5f¹² 7s²",               // 100. Fermium
    "[Rn] 5f¹³ 7s²",               // 101. Mendelevium
    "[Rn] 5f¹⁴ 7s²",               // 102. Nobelium
    "[Rn] 5f¹⁴ 7s² 7p¹"            // 103. Lawrencium
]


let electronsPerShell: [String] = [
    "1",                           // 1. Hydrogen (K:1)
    "2",                           // 2. Helium (K:2)
    "2,1",                         // 3. Lithium (K:2, L:1)
    "2,2",                         // 4. Beryllium (K:2, L:2)
    "2,3",                         // 5. Boron (K:2, L:3)
    "2,4",                         // 6. Carbon (K:2, L:4)
    "2,5",                         // 7. Nitrogen (K:2, L:5)
    "2,6",                         // 8. Oxygen (K:2, L:6)
    "2,7",                         // 9. Fluorine (K:2, L:7)
    "2,8",                         // 10. Neon (K:2, L:8)
    "2,8,1",                       // 11. Sodium (K:2, L:8, M:1)
    "2,8,2",                       // 12. Magnesium (K:2, L:8, M:2)
    "2,8,3",                       // 13. Aluminum (K:2, L:8, M:3)
    "2,8,4",                       // 14. Silicon (K:2, L:8, M:4)
    "2,8,5",                       // 15. Phosphorus (K:2, L:8, M:5)
    "2,8,6",                       // 16. Sulfur (K:2, L:8, M:6)
    "2,8,7",                       // 17. Chlorine (K:2, L:8, M:7)
    "2,8,8",                       // 18. Argon (K:2, L:8, M:8)
    "2,8,8,1",                     // 19. Potassium (K:2, L:8, M:8, N:1)
    "2,8,8,2",                     // 20. Calcium (K:2, L:8, M:8, N:2)
    "2,8,9,2",                     // 21. Scandium
    "2,8,10,2",                    // 22. Titanium
    "2,8,11,2",                    // 23. Vanadium
    "2,8,13,1",                    // 24. Chromium
    "2,8,13,2",                    // 25. Manganese
    "2,8,14,2",                    // 26. Iron
    "2,8,15,2",                    // 27. Cobalt
    "2,8,16,2",                    // 28. Nickel
    "2,8,18,1",                    // 29. Copper
    "2,8,18,2",                    // 30. Zinc
    "2,8,18,3",                    // 31. Gallium
    "2,8,18,4",                    // 32. Germanium
    "2,8,18,5",                    // 33. Arsenic
    "2,8,18,6",                    // 34. Selenium
    "2,8,18,7",                    // 35. Bromine
    "2,8,18,8",                    // 36. Krypton
    "2,8,18,8,1",                  // 37. Rubidium
    "2,8,18,8,2",                  // 38. Strontium
    "2,8,18,9,2",                  // 39. Yttrium
    "2,8,18,10,2",                 // 40. Zirconium
    "2,8,18,12,1",                 // 41. Niobium
    "2,8,18,13,1",                 // 42. Molybdenum
    "2,8,18,13,2",                 // 43. Technetium
    "2,8,18,15,1",                 // 44. Ruthenium
    "2,8,18,16,1",                 // 45. Rhodium
    "2,8,18,18",                   // 46. Palladium
    "2,8,18,18,1",                 // 47. Silver
    "2,8,18,18,2",                 // 48. Cadmium
    "2,8,18,18,3",                 // 49. Indium
    "2,8,18,18,4",                 // 50. Tin
    "2,8,18,18,5",                 // 51. Antimony
    "2,8,18,18,6",                 // 52. Tellurium
    "2,8,18,18,7",                 // 53. Iodine
    "2,8,18,18,8",                 // 54. Xenon
    "2,8,18,18,8,1",               // 55. Cesium
    "2,8,18,18,8,2",               // 56. Barium
    "2,8,18,18,9,2",               // 57. Lanthanum
    "2,8,18,19,9,2",               // 58. Cerium
    "2,8,18,21,8,2",               // 59. Praseodymium
    "2,8,18,22,8,2",               // 60. Neodymium
    "2,8,18,23,8,2",               // 61. Promethium
    "2,8,18,24,8,2",               // 62. Samarium
    "2,8,18,25,8,2",               // 63. Europium
    "2,8,18,25,9,2",               // 64. Gadolinium
    "2,8,18,27,8,2",               // 65. Terbium
    "2,8,18,28,8,2",               // 66. Dysprosium
    "2,8,18,29,8,2",               // 67. Holmium
    "2,8,18,30,8,2",               // 68. Erbium
    "2,8,18,31,8,2",               // 69. Thulium
    "2,8,18,32,8,2",               // 70. Ytterbium
    "2,8,18,32,9,2",               // 71. Lutetium
    "2,8,18,32,10,2",              // 72. Hafnium
    "2,8,18,32,11,2",              // 73. Tantalum
    "2,8,18,32,12,2",              // 74. Tungsten
    "2,8,18,32,13,2",              // 75. Rhenium
    "2,8,18,32,14,2",              // 76. Osmium
    "2,8,18,32,15,2",              // 77. Iridium
    "2,8,18,32,17,1",              // 78. Platinum
    "2,8,18,32,18,1",              // 79. Gold
    "2,8,18,32,18,2",              // 80. Mercury
    "2,8,18,32,18,3",              // 81. Thallium
    "2,8,18,32,18,4",              // 82. Lead
    "2,8,18,32,18,5",              // 83. Bismuth
    "2,8,18,32,18,6",              // 84. Polonium
    "2,8,18,32,18,7",              // 85. Astatine
    "2,8,18,32,18,8",              // 86. Radon
    "2,8,18,32,18,8,1",            // 87. Francium
    "2,8,18,32,18,8,2",            // 88. Radium
    "2,8,18,32,18,9,2",            // 89. Actinium
    "2,8,18,32,18,10,2",           // 90. Thorium
    "2,8,18,32,20,9,2",            // 91. Protactinium
    "2,8,18,32,21,9,2",            // 92. Uranium
    "2,8,18,32,22,9,2",            // 93. Neptunium
    "2,8,18,32,24,8,2",            // 94. Plutonium
    "2,8,18,32,25,8,2",            // 95. Americium
    "2,8,18,32,25,9,2",            // 96. Curium
    "2,8,18,32,27,8,2",            // 97. Berkelium
    "2,8,18,32,28,8,2",            // 98. Californium
    "2,8,18,32,29,8,2",            // 99. Einsteinium
    "2,8,18,32,30,8,2",            // 100. Fermium
    "2,8,18,32,31,8,2",            // 101. Mendelevium
    "2,8,18,32,32,8,2",            // 102. Nobelium
    "2,8,18,32,32,8,3"             // 103. Lawrencium
]

let meltingPoints: [String] = [
        "-259.14°C",
        "-272.2°C",
        "180.54°C",
        "1278°C",
        "2076°C",
        "3550°C",
        "-209.86°C",
        "-218.79°C",
        "-219.67°C",
        "-248.59°C",
        "97.72°C",
        "650°C",
        "660.32°C",
        "1414°C",
        "44.1°C",
        "112.8°C",
        "-101.5°C",
        "-189.35°C",
        "63.38°C",
        "839°C",
        "1541°C",
        "1668°C",
        "1910°C",
        "1907°C",
        "1246°C",
        "1538°C",
        "1495°C",
        "1455°C",
        "1084.62°C",
        "419.53°C",
        "29.76°C",
        "937.4°C",
        "817°C",
        "221°C",
        "-7.2°C",
        "-157.2°C",
        "39.31°C",
        "777°C",
        "1522°C",
        "1855°C",
        "2477°C",
        "2623°C",
        "2157°C",
        "2334°C",
        "1964°C",
        "1554.9°C",
        "961.78°C",
        "320.9°C",
        "156.6°C",
        "231.93°C",
        "630.63°C",
        "449.51°C",
        "113.7°C",
        "-111.8°C",
        "28.44°C",
        "727°C",
        "920°C",
        "798°C",
        "931°C",
        "1021°C",
        "1045°C",
        "1072°C",
        "822°C",
        "1313°C",
        "1356°C",
        "1412°C",
        "1474°C",
        "1529°C",
        "1545°C",
        "824°C",
        "1652°C",
        "2233°C",
        "3017°C",
        "3422°C",
        "3186°C",
        "3033°C",
        "2446°C",
        "1768.3°C",
        "1064.18°C",
        "-38.83°C",
        "303.5°C",
        "327.46°C",
        "271.3°C",
        "254°C",
        "302°C",
        "-71°C",
        "27°C",
        "700°C",
        "1050°C",
        "1750°C",
        "1572°C",
        "1132.3°C",
        "637°C",
        "639.5°C",
        "994°C",
        "1340°C",
        "986°C",
        "900°C",
        "860°C",
        "1527°C",
        "827°C",
        "827°C",
        "1900°C"
    ]

let densities: [String] = [
    "0.0899 g/cm³",  // 1. Hydrogen
    "0.1785 g/cm³",  // 2. Helium
    "0.534 g/cm³",   // 3. Lithium
    "1.848 g/cm³",   // 4. Beryllium
    "2.34 g/cm³",    // 5. Boron
    "2.267 g/cm³",   // 6. Carbon
    "1.251 g/cm³",   // 7. Nitrogen
    "1.429 g/cm³",   // 8. Oxygen
    "1.696 g/cm³",   // 9. Fluorine
    "0.9 g/cm³",     // 10. Neon
    "0.968 g/cm³",   // 11. Sodium
    "1.738 g/cm³",   // 12. Magnesium
    "2.7 g/cm³",     // 13. Aluminum
    "2.329 g/cm³",   // 14. Silicon
    "1.82 g/cm³",    // 15. Phosphorus
    "2.07 g/cm³",    // 16. Sulfur
    "3.214 g/cm³",   // 17. Chlorine
    "1.784 g/cm³",   // 18. Argon
    "0.862 g/cm³",   // 19. Potassium
    "1.55 g/cm³",    // 20. Calcium
    "2.989 g/cm³",   // 21. Scandium
    "4.506 g/cm³",   // 22. Titanium
    "6.11 g/cm³",    // 23. Vanadium
    "7.19 g/cm³",    // 24. Chromium
    "7.44 g/cm³",    // 25. Manganese
    "7.874 g/cm³",   // 26. Iron
    "8.9 g/cm³",     // 27. Cobalt
    "8.908 g/cm³",   // 28. Nickel
    "8.96 g/cm³",    // 29. Copper
    "7.14 g/cm³",    // 30. Zinc
    "5.907 g/cm³",   // 31. Gallium
    "5.323 g/cm³",   // 32. Germanium
    "5.727 g/cm³",   // 33. Arsenic
    "4.809 g/cm³",   // 34. Selenium
    "3.12 g/cm³",    // 35. Bromine
    "3.708 g/cm³",   // 36. Krypton
    "1.532 g/cm³",   // 37. Rubidium
    "2.64 g/cm³",    // 38. Strontium
    "4.472 g/cm³",   // 39. Yttrium
    "6.506 g/cm³",   // 40. Zirconium
    "8.57 g/cm³",    // 41. Niobium
    "10.28 g/cm³",   // 42. Molybdenum
    "11.5 g/cm³",    // 43. Technetium
    "12.37 g/cm³",   // 44. Ruthenium
    "12.41 g/cm³",   // 45. Rhodium
    "12.02 g/cm³",   // 46. Palladium
    "10.49 g/cm³",   // 47. Silver
    "8.65 g/cm³",    // 48. Cadmium
    "7.31 g/cm³",    // 49. Indium
    "7.31 g/cm³",    // 50. Tin
    "6.697 g/cm³",   // 51. Antimony
    "6.24 g/cm³",    // 52. Tellurium
    "4.94 g/cm³",    // 53. Iodine
    "5.895 g/cm³",   // 54. Xenon
    "1.873 g/cm³",   // 55. Cesium
    "3.51 g/cm³",    // 56. Barium
    "6.146 g/cm³",   // 57. Lanthanum
    "6.77 g/cm³",    // 58. Cerium
    "6.773 g/cm³",   // 59. Praseodymium
    "7.007 g/cm³",   // 60. Neodymium
    "7.26 g/cm³",    // 61. Promethium
    "7.52 g/cm³",    // 62. Samarium
    "5.244 g/cm³",   // 63. Europium
    "7.9 g/cm³",     // 64. Gadolinium
    "8.23 g/cm³",    // 65. Terbium
    "8.55 g/cm³",    // 66. Dysprosium
    "8.8 g/cm³",     // 67. Holmium
    "9.066 g/cm³",   // 68. Erbium
    "9 g/cm³",       // 69. Thulium
    "9 g/cm³",       // 70. Ytterbium
    "9 g/cm³",       // 71. Lutetium
    "9 g/cm³",       // 72. Hafnium
    "9 g/cm³",       // 73. Tantalum
    "9 g/cm³",       // 74. Tungsten
    "9 g/cm³",       // 75. Rhenium
    "9 g/cm³",       // 76. Osmium
    "9 g/cm³",       // 77. Iridium
    "9 g/cm³",       // 78. Platinum
    "9 g/cm³",       // 79. Gold
    "9 g/cm³",       // 80. Mercury
    "9 g/cm³",       // 81. Thallium
    "9 g/cm³",       // 82. Lead
    "9 g/cm³",       // 83. Bismuth
    "9 g/cm³",       // 84. Polonium
    "9 g/cm³",       // 85. Astatine
    "9 g/cm³",       // 86. Radon
    "9 g/cm³",       // 87. Francium
    "9 g/cm³",       // 88. Radium
    "9 g/cm³",       // 89. Actinium
    "9 g/cm³",       // 90. Thorium
    "9 g/cm³",       // 91. Protactinium
    "9 g/cm³",       // 92. Uranium
    "9 g/cm³",       // 93. Neptunium
    "9 g/cm³",       // 94. Plutonium
    "9 g/cm³",       // 95. Americium
    "9 g/cm³",       // 96. Curium
    "9 g/cm³",       // 97. Berkelium
    "9 g/cm³",       // 98. Californium
    "9 g/cm³",       // 99. Einsteinium
    "9 g/cm³",       // 100. Fermium
    "9 g/cm³",       // 101. Mendelevium
    "9 g/cm³",       // 102. Nobelium
    "9 g/cm³"        // 103. Lawrencium
]
let oxidationStates: [String] = [
    "-1, 0, +1",  // 1. Hydrogen (H)
    "0",  // 2. Helium (He)
    "+1",  // 3. Lithium (Li)
    "+2",  // 4. Beryllium (Be)
    "+3",  // 5. Boron (B)
    "-4, -3, -2, -1, 0, +1, +2, +3, +4",  // 6. Carbon (C)
    "-3, -2, -1, 0, +1, +2, +3, +4, +5",  // 7. Nitrogen (N)
    "-2, -1, 0, +1, +2",  // 8. Oxygen (O)
    "-1, 0, +1",  // 9. Fluorine (F)
    "0",  // 10. Neon (Ne)
    "+1",  // 11. Sodium (Na)
    "+2",  // 12. Magnesium (Mg)
    "+3",  // 13. Aluminum (Al)
    "-4, -3, -2, 0, +1, +2, +3, +4",  // 14. Silicon (Si)
    "-3, -2, -1, 0, +1, +2, +3, +4, +5",  // 15. Phosphorus (P)
    "-2, -1, 0, +2, +4, +6",  // 16. Sulfur (S)
    "-1, +1, +3, +5, +7",  // 17. Chlorine (Cl)
    "0",  // 18. Argon (Ar)
    "+1",  // 19. Potassium (K)
    "+2",  // 20. Calcium (Ca)
    "+3",  // 21. Scandium (Sc)
    "+2, +3, +4",  // 22. Titanium (Ti)
    "+2, +3, +4, +5",  // 23. Vanadium (V)
    "-2, -1, 0, +1, +2, +3, +4, +5, +6",  // 24. Chromium (Cr)
    "-3, -2, -1, 0, +1, +2, +3, +4, +5, +6, +7",  // 25. Manganese (Mn)
    "-4, -2, -1, 0, +2, +3, +4, +5, +6",  // 26. Iron (Fe)
    "-1, +1, +2, +3",  // 27. Cobalt (Co)
    "-1, 0, +1, +2, +3, +4",  // 28. Nickel (Ni)
    "+1, +2",  // 29. Copper (Cu)
    "+2",  // 30. Zinc (Zn)
    "+3",  // 31. Gallium (Ga)
    "-4, +2, +4",  // 32. Germanium (Ge)
    "-3, -1, +3, +5",  // 33. Arsenic (As)
    "-2, +2, +4, +6",  // 34. Selenium (Se)
    "-1, +1, +3, +5, +7",  // 35. Bromine (Br)
    "0",  // 36. Krypton (Kr)
    "+1",  // 37. Rubidium (Rb)
    "+2",  // 38. Strontium (Sr)
    "+3",  // 39. Yttrium (Y)
    "+4",  // 40. Zirconium (Zr)
    "+3, +5",  // 41. Niobium (Nb)
    "+2, +3, +4, +5, +6",  // 42. Molybdenum (Mo)
    "+3, +4, +5, +6, +7",  // 43. Technetium (Tc)
    "+2, +3, +4, +5, +6, +7, +8",  // 44. Ruthenium (Ru)
    "+3, +4, +5",  // 45. Rhodium (Rh)
    "+2, +4",  // 46. Palladium (Pd)
    "+1, +2",  // 47. Silver (Ag)
    "+2",  // 48. Cadmium (Cd)
    "+1, +3",  // 49. Indium (In)
    "+2, +4",  // 50. Tin (Sn)
    "-3, +3, +5",  // 51. Antimony (Sb)
    "-2, +2, +4, +6",  // 52. Tellurium (Te)
    "-1, +1, +3, +5, +7",  // 53. Iodine (I)
    "0",  // 54. Xenon (Xe)
    "+1",  // 55. Cesium (Cs)
    "+2",  // 56. Barium (Ba)
    "+3",  // 57. Lanthanum (La)
    "+3, +4",  // 58. Cerium (Ce)
    "+3",  // 59. Praseodymium (Pr)
    "+3",  // 60. Neodymium (Nd)
    "+3",  // 61. Promethium (Pm)
    "+2, +3",  // 62. Samarium (Sm)
    "+2, +3",  // 63. Europium (Eu)
    "+3",  // 64. Gadolinium (Gd)
    "+3, +4",  // 65. Terbium (Tb)
    "+3",  // 66. Dysprosium (Dy)
    "+3",  // 67. Holmium (Ho)
    "+3",  // 68. Erbium (Er)
    "+3",  // 69. Thulium (Tm)
    "+2, +3",  // 70. Ytterbium (Yb)
    "+3",  // 71. Lutetium (Lu)
    "+4",  // 72. Hafnium (Hf)
    "+5",  // 73. Tantalum (Ta)
    "+4, +6",  // 74. Tungsten (W)
    "+3, +4, +5, +6, +7",  // 75. Rhenium (Re)
    "+2, +3, +4, +5, +6, +8",  // 76. Osmium (Os)
    "+3, +4",  // 77. Iridium (Ir)
    "+2, +4",  // 78. Platinum (Pt)
    "+1, +3",  // 79. Gold (Au)
    "+2",  // 80. Mercury (Hg)
    "+1, +3",  // 81. Thallium (Tl)
    "+2, +4",  // 82. Lead (Pb)
    "+3, +5",  // 83. Bismuth (Bi)
    "+2, +4",  // 84. Polonium (Po)
    "-1, +1, +3, +5, +7",  // 85. Astatine (At)
    "0",  // 86. Radon (Rn)
    "+1",  // 87. Francium (Fr)
    "+2",  // 88. Radium (Ra)
    "+3",  // 89. Actinium (Ac)
    "+4",  // 90. Thorium (Th)
    "+4, +5",  // 91. Protactinium (Pa)
    "+3, +4, +5, +6",  // 92. Uranium (U)
    "+3, +4, +5, +6",  // 93. Neptunium (Np)
    "+3, +4, +5, +6",  // 94. Plutonium (Pu)
    "+3, +4, +5, +6",  // 95. Americium (Am)
    "+3, +4",  // 96. Curium (Cm)
    "+3, +4",  // 97. Berkelium (Bk)
    "+3, +4",  // 98. Californium (Cf)
    "+3, +4",  // 99. Einsteinium (Es)
    "+3, +4",  // 100. Fermium (Fm)
    "+3, +4",  // 101. Mendelevium (Md)
    "+3",  // 102. Nobelium (No)
    "+3"  // 103. Lawrencium (Lr)
]


let valanceShellElectrons: [Int] = [1,2,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,2,2,2,1,2,2,2,2,1,2,3,4,5,6,7,8,1,2,2,2,1,1,2,1,1,18,1,2,3,4,5,6,7,8,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,3,4,5,6,7,8,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3]
                                    
let elementUses: [[String]] = [
    ["Rocket fuel", "Ammonia", "Fuel cells"], // Hydrogen
    ["Supercooling", "Balloons", "Cryogenics"], // Helium
    ["Batteries", "Medicine", "Alloys"], // Lithium
    ["Aerospace", "X-rays", "Reactors"], // Beryllium
    ["Glass", "Detergents", "Therapy"], // Boron
    ["Steel", "Chemistry", "Fuel"], // Carbon
    ["Fertilizer", "Explosives", "Cryo storage"], // Nitrogen
    ["Breathing", "Steel", "Water treatment"], // Oxygen
    ["Toothpaste", "Teflon", "Processing"], // Fluorine
    ["Signs", "Cryogenics", "Indicators"], // Neon
    ["Lamps", "Glass", "Soap"], // Sodium
    ["Aircraft", "Medicine", "Fireworks"], // Magnesium
    ["Foil", "Cans", "Structures"], // Aluminum
    ["Chips", "Fibers", "Alloys"], // Silicon
    ["Alloys", "Pigments", "Fireworks"], // Phosphorus
    ["Acid", "Rubber", "Fungicides"], // Sulfur
    ["Disinfectant", "Purification", "Plastics"], // Chlorine
    ["Lighting", "Cryo", "Insulators"], // Argon
    ["Salt", "Chemicals", "Preservation"], // Potassium
    ["Construction", "Glass", "Steel"], // Calcium
    ["Fireworks", "Electronics", "Imaging"], // Scandium
    ["Alloys", "Implants", "Pigments"], // Titanium
    ["Steel", "Magnets", "Batteries"], // Vanadium
    ["Tools", "Contacts", "Plating"], // Chromium
    ["Steel", "Magnets", "Pigments"], // Manganese
    ["Steel", "Magnets", "Catalysts"], // Iron
    ["Alloys", "Batteries", "Coins"], // Nickel
    ["Coins", "Jewelry", "Connectors"], // Copper
    ["Galvanizing", "Batteries", "Alloys"], // Zinc
    ["Coating", "Brass", "Reactors"], // Gallium
    ["Chips", "Alloys", "LEDs"], // Germanium
    ["Retardants", "Optics", "Shielding"], // Arsenic
    ["Fertilizer", "Matches", "Alloys"], // Selenium
    ["X-rays", "Chips", "Solar cells"], // Bromine
    ["Coolants", "Displays", "Propulsion"], // Krypton
    ["Reactors", "Switches", "Alloys"], // Rubidium
    ["Glass", "Catalysts", "Lighting"], // Strontium
    ["Electronics", "Aerospace", "Magnets"], // Yttrium
    ["Ceramics", "Superconductors", "Catalysts"], // Zirconium
    ["Magnets", "Steel", "Imaging"], // Niobium
    ["Tools", "Filaments", "Aerospace"], // Molybdenum
    ["Pigments", "Magnets", "Control rods"], // Technetium
    ["X-rays", "Catalysts", "Hard alloys"], // Ruthenium
    ["Jewelry", "Catalysts", "Disks"], // Rhodium
    ["Jewelry", "Plating", "Contacts"], // Palladium
    ["Jewelry", "Coins", "Electronics"], // Silver
    ["Batteries", "Pigments", "Alloys"], // Cadmium
    ["Shielding", "X-rays", "Chips"], // Indium
    ["Alloys", "Chips", "Shielding"], // Tin
    ["Coating", "Glass", "Pigments"], // Antimony
    ["Chips", "Catalysts", "Pigments"], // Tellurium
    ["Purification", "Disinfectant", "Medicine"], // Iodine
    ["Lighting", "Cryo", "Propulsion"], // Xenon
    ["Lasers", "Electronics", "Superconductors"], // Cesium
    ["Glass", "Fertilizers", "Explosives"], // Barium
    ["Reactors", "Electronics", "Magnets"], // Lanthanum
    ["Magnets", "Catalysts", "Optics"], // Cerium
    ["Lasers", "Alloys", "Magnets"], // Praseodymium
    ["Magnets", "Chips", "Ceramics"], // Neodymium
    ["Magnets", "Ceramics", "Optics"], // Promethium
    ["Fuel", "Magnets", "Superconductors"], // Samarium
    ["Magnets", "Ceramics", "Alloys"], // Europium
    ["Magnets", "Alloys", "Glass"], // Gadolinium
    ["Magnets", "Alloys", "Electronics"], // Terbium
    ["Magnets", "Ceramics", "Alloys"], // Dysprosium
    ["Magnets", "Electronics", "Alloys"], // Holmium
    ["Magnets", "Electronics", "Alloys"], // Erbium
    ["Magnets", "Electronics", "Glass"], // Thulium
    ["Magnets", "Alloys", "Electronics"], // Ytterbium
    ["Magnets", "Alloys", "Ceramics"], // Lutetium
    ["Magnets", "Ceramics", "Reactors"], // Hafnium
    ["Magnets", "Alloys", "Tools"], // Tantalum
    ["Filaments", "Tools", "Aerospace"], // Tungsten
    ["Pigments", "Ceramics", "Magnets"], // Rhenium
    ["Jewelry", "Catalysts", "Chips"], // Osmium
    ["Jewelry", "Chips", "Catalysts"], // Iridium
    ["Jewelry", "Coins", "Chips"], // Platinum
    ["Coins", "Jewelry", "Conductors"], // Gold
    ["Batteries", "Alloys", "Pigments"], // Mercury
    ["Shielding", "Alloys", "Pigments"], // Thallium
    ["Optics", "Ceramics", "Superconductors"], // Lead
    ["X-rays", "Chips", "Pigments"], // Bismuth
    ["Reactors", "Pigments", "Ceramics"], // Polonium
    ["Lighting", "Propulsion", "Coatings"], // Astatine
    ["Lighting", "Lasers", "Propulsion"], // Radon
    ["Reactors", "Magnets", "Alloys"], // Francium
    ["Glass", "Chips", "Magnets"], // Radium
    ["Reactors", "Magnets", "Superconductors"], // Actinium
    ["Fuel", "Magnets", "Optics"], // Thorium
    ["Reactors", "Magnets", "Superconductors"], // Protactinium
    ["Fuel", "Magnets", "Superconductors"], // Uranium
    ["Reactors", "Magnets", "Superconductors"], // Neptunium
    ["Fuel", "Magnets", "Superconductors"], // Plutonium
    ["Reactors", "Magnets", "Superconductors"], // Americium
    ["Reactors", "Magnets", "Superconductors"], // Curium
    ["Reactors", "Magnets", "Superconductors"], // Berkelium
    ["Reactors", "Magnets", "Superconductors"], // Californium
    ["Research", "Magnets", "Superconductors"], // Einsteinium
    ["Research", "Magnets", "Superconductors"], // Fermium
    ["Research", "Magnets", "Superconductors"], // Mendelevium
    ["Research", "Magnets", "Superconductors"], // Nobelium
    ["Research", "Study", "Nuclear"], // Lawrencium
    ["Research", "Study", "Nuclear"]
]


let elementUsesVediosLink:[String] = [
    "https://www.youtube.com/shorts/H808apdGzXk",//H
    "https://www.youtube.com/shorts/adOfHtA0vgw",//he
    "https://www.youtube.com/shorts/yGDkiUAwxRs",//li
    "https://www.youtube.com/shorts/D6BchzYML0M",//be
    "https://www.youtube.com/shorts/svfpG-NgO3o",//b
    "https://www.youtube.com/shorts/DJxF6MOYYu8",//c
    "https://www.youtube.com/shorts/dak8kmL348w",//n
    "https://www.youtube.com/shorts/Z6rhk95-FVU",//o
    "https://www.youtube.com/shorts/Dd349NWrNyo",//f
    "https://www.youtube.com/shorts/gloS2lc7j3E",//ne
    "https://www.youtube.com/shorts/Bd2iI1A1Ya0",//na
    "https://www.youtube.com/shorts/kVdmVkkDulM",//mg
    "https://www.youtube.com/shorts/5T8jamtBhJA",//al
    "https://www.youtube.com/shorts/GF2z9LewLEo",//si
    "https://www.youtube.com/shorts/uRl5A1TnP64",//phosphorous
    "https://www.youtube.com/shorts/htbVB6ILHPI",//sulfur
    "https://www.youtube.com/watch?v=mY6skQnW0i8",//cholorine
    "https://www.youtube.com/watch?v=rK_m7sSn-yo",//argon
    "https://www.youtube.com/shorts/cRChlWZkAXs",//potassium
    "https://www.youtube.com/watch?v=HP0UPkMF1gA",//calcium
    "https://www.youtube.com/shorts/c3jOSjk3KdA",//scandium
    "https://www.youtube.com/shorts/xgUwncDet30",//titanium
    "https://www.youtube.com/shorts/pVDxGtISlco",//vanadium
    "https://www.youtube.com/shorts/b7ucW6T2tRE",//chromium
    "https://www.youtube.com/shorts/FtHmbzc5dwo",//manganese
    "https://www.youtube.com/watch?v=XV609o_o9kg",//iron
    "https://www.youtube.com/shorts/n3B25em1PZU",//cobalt
    "https://www.youtube.com/shorts/tBl6PNKaY2g",//nickle
    "https://www.youtube.com/watch?v=jP_t1lo0ZgA",//copper
    "https://www.youtube.com/watch?v=TuJXgMex85g",//zinc
    "https://www.youtube.com/shorts/nqedbR9SKMA",//gallium
    "https://www.youtube.com/shorts/hOkrL0VaqXA",//germinium
    "https://www.youtube.com/shorts/fQR-i-hiQe0",//arsenic
    "https://www.youtube.com/watch?v=cc26zFE8X1k",//selenium
    "https://www.youtube.com/shorts/eLvXS6J_ETQ",//bromine
    "https://www.youtube.com/watch?v=il4OOY7Zseg",//krypton
    "https://www.youtube.com/watch?v=0XLGopBovoI",//rubidium
    "https://www.youtube.com/watch?v=d5ztPGrsgNQ",//strontium
    "https://www.youtube.com/watch?v=NxbOQ1FhqdQ",//yttrium
    "https://www.youtube.com/watch?v=gNJE2MPktvg",//zirconium
    "https://www.youtube.com/watch?v=ynfGLg9_ic8",//nobidium
    "https://www.youtube.com/watch?v=Diu01OdWh44",//molybedinium
    "https://www.youtube.com/watch?v=ud5c1TVkcnU",//technitium
    "https://www.youtube.com/watch?v=wl5ZYb0hDTc",//ruthenium
    "https://www.youtube.com/watch?v=ZBO1F3Z9Csk",//rhodium
    "https://youtu.be/R09uuzclDI0",//palladium
    "https://www.youtube.com/watch?v=4oyKUt4nPwc",//silver
    "https://www.youtube.com/watch?v=boRius1DYdQ",//cadmium
    "https://www.youtube.com/watch?v=TviX7V-ay5I",//indium
    "https://www.youtube.com/watch?v=qht_NDXCsw4",//tin
    "https://www.youtube.com/watch?v=tm37Ybya1ts",//antimony
    "https://www.youtube.com/watch?v=5ChFbVu4Mpk",//tellurium
    "https://www.youtube.com/watch?v=H9ceTN-4PN0",//iodine
    "https://youtu.be/Ejoct_6pQ74",//xenon
    "https://www.youtube.com/watch?v=5aD6HwUE2c0",//caesium
    "https://youtu.be/9srJdQU3NOo",//barium
    "https://www.youtube.com/watch?v=Q21clW0s0B8",//lanthanum
    "https://www.youtube.com/watch?v=frD3126ry8o",//cerium
    "https://youtu.be/IL06CzXF3ns",//paresmodium
    "https://youtu.be/XZZDy_R2h7E",//neodymium
    "https://youtu.be/HplP_MY78NQ",//promethium
    "https://www.youtube.com/watch?v=LpTkBg8HpvY",//samarium
    "https://www.youtube.com/watch?v=88YOmg_FUVo",//europium
    "https://www.youtube.com/watch?v=uUo7pY38fGY",//gadolinium
    "https://youtu.be/On5LjH9TQxY",//terbium
    "https://youtu.be/hFfR_qOSa-8",//dysprosium
    "https://www.youtube.com/watch?v=HQahtzCU0BU",//Holmium
    "https://www.youtube.com/watch?v=E-DY_RT4fJ4",//eurbium
    "https://youtu.be/vS0vhYdOGMc",//thulium
    "https://youtu.be/RAqRI9wTuk8",//ytterbium
    "https://youtu.be/7wrDfRnRHqI",//lutetium
    "https://youtu.be/Qb9f5uBKJhg",//hafnium
    "https://youtu.be/51xFP1Yn3g0",//tanthalum
    "https://youtu.be/dqMY6sdVqf8",//tungsten
    "https://youtu.be/BIJXqzWiHtI",//rhenium
    "https://youtu.be/D9C_lbivcn4",//osmium
    "https://youtu.be/lGy1vGnYAak",//iridium
    "https://www.youtube.com/watch?v=vhPu-3b0FnY",//platinum
    "https://www.youtube.com/watch?v=vhPu-3b0FnY",//gold
    "https://www.youtube.com/watch?v=ayMwyJO9AB4",//mercury
    "https://www.youtube.com/watch?v=4SVhSZ-rfLM",//thallium
    "https://www.youtube.com/watch?v=2ERfPN5JLX8",//lead
    "https://www.youtube.com/watch?v=vyIo-c7VmIM",//bismuth
    "https://www.youtube.com/watch?v=bbr5yWwsI1o",//polonium
    "https://www.youtube.com/watch?v=GP8jJgzEmwE",//astatine
    "https://www.youtube.com/watch?v=mTuC_LrEfbU",//radon
    "https://www.youtube.com/watch?v=PyFLvSg6ZDw",//francium
    "https://www.youtube.com/watch?v=I_1XelLa1eo",//radium
    "https://www.youtube.com/watch?v=rKm0ShaJNFM",//actinum
    "https://youtu.be/FjHH8Qf3aO4",//thorium
    "https://www.youtube.com/watch?v=pXH0YECjoZI",//protacinum
    "https://www.youtube.com/watch?v=0sIHd1Jhtp4",//uranium
    "https://youtu.be/1D75B0_URbE",//neptunium
    "https://www.youtube.com/watch?v=5LRK5vOESw8",//plutonium
    "https://www.youtube.com/watch?v=ls2oAiUo5gQ",//americium
    "https://www.youtube.com/watch?v=55R1JzEjISw",//curium
    "https://youtu.be/7p1D9C1qkZY",//berkilium
    "https://www.youtube.com/watch?v=Fk7f0h0n7tw",//californium
    "https://www.youtube.com/watch?v=Hq1kz09K2W4",//einstenium
    "https://www.youtube.com/watch?v=zNOeVoHnkYg",//fermium
    "https://www.youtube.com/watch?v=OGZa7iiyg8A",//mendelvium
    "https://www.youtube.com/watch?v=tzZjHz4vhrI",//nobelium
    "https://www.youtube.com/watch?v=ab9E5ZbfAQU",//lawrentium
]
