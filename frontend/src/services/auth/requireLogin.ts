import { useUserStore } from '@/stores/user'
import { loginByCurrentPlatform } from './login'

export const requireLogin = async (): Promise<boolean> => {
  const userStore = useUserStore()

  if (userStore.isLoggedIn) {
    return true
  }

  const result = await loginByCurrentPlatform()
  return result.success
}

export const withLoginGuard = async (action: () => void | Promise<void>) => {
  const passed = await requireLogin()

  if (!passed) {
    return false
  }

  await action()
  return true
}