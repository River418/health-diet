import { beforeEach, describe, expect, it, vi } from 'vitest'

const loginByCurrentPlatformMock = vi.fn()

vi.mock('@/services/auth/login', () => ({
  loginByCurrentPlatform: loginByCurrentPlatformMock
}))

vi.mock('@/stores/user', () => ({
  useUserStore: () => ({
    isLoggedIn: false
  })
}))

describe('withLoginGuard', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  it('runs the action after login succeeds', async () => {
    const action = vi.fn()
    loginByCurrentPlatformMock.mockResolvedValue({ success: true })

    const { withLoginGuard } = await import('@/services/auth/requireLogin')
    await withLoginGuard(action)

    expect(action).toHaveBeenCalledTimes(1)
  })

  it('does not run the action after login fails', async () => {
    const action = vi.fn()
    loginByCurrentPlatformMock.mockResolvedValue({ success: false, reason: 'failed' })

    const { withLoginGuard } = await import('@/services/auth/requireLogin')
    await withLoginGuard(action)

    expect(action).not.toHaveBeenCalled()
  })
})