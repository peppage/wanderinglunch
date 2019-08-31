import AdminQueue from './AdminQueue.svelte'
import LocationList from './LocationList.svelte'
import TruckList from './TruckList.svelte'
import SubList from './SubList.svelte'

const adminQueue = new AdminQueue({
	target: document.querySelector('#adminQueue')
})

const locationList = new LocationList({
	target: document.querySelector('#locationList')
})

const truckList = new TruckList({
	target: document.querySelector('#truckList')
})

const subList = new SubList({
	target: document.querySelector('#subList')
})

export default { adminQueue, locationList, truckList }
