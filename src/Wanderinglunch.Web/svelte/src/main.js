import AdminQueue from './AdminQueue.svelte'
import LocationList from './LocationList.svelte'
import TruckList from './TruckList.svelte'

const adminQueue = new AdminQueue({
	target: document.querySelector('#adminQueue')
})

const locationList = new LocationList({
	target: document.querySelector('#locationList')
})

const truckList = new TruckList({
	target: document.querySelector('#truckList')
})

export default { adminQueue, locationList, truckList }
